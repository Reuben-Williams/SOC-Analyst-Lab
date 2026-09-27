<#
Run manually as administrator INSIDE the owned Windows lab VM.
Creates and removes one disabled temporary local account, attempts logon to a
nonexistent local account, runs an inert encoded command, and opens five TCP
connections to the explicitly supplied owned lab destination.
Does not change auditing, Sysmon, firewall, forwarding, or execution policy.
Raw events stay in an ignored local-only directory; review before publishing.
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$ExpectedComputerName,
    [Parameter(Mandatory=$true)][System.Net.IPAddress]$LabDestination,
    [ValidateRange(1,65535)][int]$LabPort = 8000,
    [Parameter(Mandatory=$true)][switch]$ConfirmOwnedLab,
    [string]$OutputDirectory = (Join-Path $PSScriptRoot 'local-only/windows-exercise')
)
$ErrorActionPreference = 'Stop'
if (-not $ConfirmOwnedLab) { throw 'Explicit owned-lab confirmation is required.' }
if ($env:COMPUTERNAME -ne $ExpectedComputerName) { throw 'Computer name does not match the explicit lab target.' }
if ((Get-CimInstance Win32_ComputerSystem).Model -notmatch 'Virtual Machine') { throw 'This harness requires a Windows virtual machine.' }
$principal = [Security.Principal.WindowsPrincipal]::new([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { throw 'Run inside the lab VM as administrator.' }
if (-not [Environment]::Is64BitProcess) { throw 'Use 64-bit PowerShell for LocalAccounts support.' }
$runId = 'soc' + [guid]::NewGuid().ToString('N').Substring(0,8)
$missingUser = 'missing_' + $runId
$createdUser = $runId
$start = Get-Date
$runFolder = Join-Path $OutputDirectory $runId
New-Item -ItemType Directory -Path $runFolder -Force | Out-Null
$passwordPlain = [guid]::NewGuid().ToString('N') + '!aA7'
$passwordSecure = ConvertTo-SecureString $passwordPlain -AsPlainText -Force
$passwordPlain = $null
$created = $false
$logonErrors = @()
$networkResults = @()
Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;
public static class SocLabLogon {
 [DllImport("advapi32.dll", SetLastError=true, CharSet=CharSet.Unicode)]
 public static extern bool LogonUser(string u, string d, string p, int t, int provider, out IntPtr token);
 [DllImport("kernel32.dll")] public static extern bool CloseHandle(IntPtr token);
}
'@
try {
    if (Get-LocalUser -Name $createdUser -ErrorAction SilentlyContinue) { throw 'Unexpected account collision.' }
    if (Get-LocalUser -Name $missingUser -ErrorAction SilentlyContinue) { throw 'Negative-test account must not exist.' }
    New-LocalUser -Name $createdUser -Password $passwordSecure -Disabled -Description "Disposable SOC lab exercise $runId" | Out-Null
    $created = $true
    for ($i=0; $i -lt 10; $i++) {
        $handle = [IntPtr]::Zero
        $ok = [SocLabLogon]::LogonUser($missingUser,$env:COMPUTERNAME,'INVALID-LAB-TEST',3,0,[ref]$handle)
        $errorCode = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
        if ($handle -ne [IntPtr]::Zero) { [void][SocLabLogon]::CloseHandle($handle) }
        if ($ok) { throw 'Unexpected successful login; stopping.' }
        $logonErrors += $errorCode
        Start-Sleep -Milliseconds 200
    }
    $encoded = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes("Write-Output '$runId harmless encoded test'"))
    & "$env:SystemRoot/System32/WindowsPowerShell/v1.0/powershell.exe" -NoProfile -NonInteractive -EncodedCommand $encoded
    if ($LASTEXITCODE -ne 0) { throw 'Inert PowerShell test failed.' }
    for ($i=0; $i -lt 5; $i++) {
        $client = [Net.Sockets.TcpClient]::new()
        try {
            $connect = $client.ConnectAsync($LabDestination.ToString(),$LabPort)
            if (-not $connect.Wait(3000)) { throw 'Connection timed out.' }
            $networkResults += 'connected'
        } catch { $networkResults += 'not-connected' }
        finally { $client.Dispose() }
    }
} finally {
    if ($created) { Remove-LocalUser -Name $createdUser -ErrorAction Stop }
    $passwordSecure.Dispose()
}
Start-Sleep -Seconds 3
$security = @(Get-WinEvent -FilterHashtable @{LogName='Security';StartTime=$start;Id=4625,4720,4688} -ErrorAction SilentlyContinue |
    Where-Object { $_.ToXml().Contains($runId) -or $_.ToXml().Contains($encoded) })
$sysmon = @(Get-WinEvent -FilterHashtable @{LogName='Microsoft-Windows-Sysmon/Operational';StartTime=$start;Id=1,3} -ErrorAction SilentlyContinue |
    Where-Object { $_.ToXml().Contains($runId) -or $_.ToXml().Contains($encoded) -or ($_.Id -eq 3 -and $_.ToXml().Contains($LabDestination.ToString())) })
$security | ForEach-Object { $_.ToXml() } | Set-Content (Join-Path $runFolder 'security-events.txt') -Encoding UTF8
$sysmon | ForEach-Object { $_.ToXml() } | Set-Content (Join-Path $runFolder 'sysmon-events.txt') -Encoding UTF8
$summary = [ordered]@{
    RunId=$runId; StartedUtc=$start.ToUniversalTime().ToString('o'); EndedUtc=(Get-Date).ToUniversalTime().ToString('o')
    TemporaryAccountRemoved=($null -eq (Get-LocalUser -Name $createdUser -ErrorAction SilentlyContinue))
    FailedLogonReturnCodes=$logonErrors; TcpAttempts=$networkResults
    MatchingSecurityRecords=$security.Count; MatchingSysmonRecords=$sysmon.Count
    SecurityEventCounts=@($security | Group-Object Id | Select-Object Name,Count)
    SysmonEventCounts=@($sysmon | Group-Object Id | Select-Object Name,Count)
    Note='Local execution summary only. No SIEM ingestion or end-to-end detection validation is implied. Network event correlation requires manual review.'
}
$summary | ConvertTo-Json -Depth 5 | Set-Content (Join-Path $runFolder 'summary.json') -Encoding UTF8
$summary | ConvertTo-Json -Depth 5
Write-Output "Evidence remains local in $runFolder. Review before sharing."
