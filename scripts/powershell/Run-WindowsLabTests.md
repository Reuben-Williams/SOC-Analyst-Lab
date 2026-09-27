# Fresh Windows endpoint exercise

**Prepared and syntax-checked only. Not executed in the lab VM.**

Run [Invoke-WindowsLabTests.ps1](Invoke-WindowsLabTests.ps1) manually in a 64-bit administrator PowerShell session **inside the owned Windows lab VM**. Follow existing execution policy; do not weaken it. Replace the two placeholders with the actual guest computer name and a destination you own in the lab.

```powershell
./Invoke-WindowsLabTests.ps1 -ExpectedComputerName '<GUEST_COMPUTER_NAME>' -LabDestination '<OWNED_LAB_IP>' -LabPort 8000 -ConfirmOwnedLab
```

The destination should be the owned Splunk VM listening on the selected port; the test opens five TCP connections and sends no application payload. It must not target an employer or third party.

The script creates then removes a disabled temporary local account, makes ten failed authentication attempts against a separate nonexistent local account, and runs an encoded `Write-Output` command with a unique marker. It does not change audit policy, Sysmon, forwarding, network settings, or execution policy. It refuses to run outside a VM, without administrator rights, or when the explicit computer name does not match.

**Prerequisites:** user-account management auditing for 4720, failed-logon auditing for 4625, process creation and command-line auditing for 4688 (if that path is used), Sysmon process/network collection, and a verified forwarding route. The script will not silently configure these. Missing records must be investigated rather than counted as a pass.

Results go to a new `local-only/windows-exercise/<run-id>` directory alongside the script. Review `summary.json` and matching event XML locally. The directory is ignored by Git. Do not force-add it. Publish only sanitized extracts and screenshots after checking for sensitive data.

Correlate by run ID and UTC times. Authentication may populate the source IP as a placeholder for local calls; a source-IP threshold query may therefore require a separate local-logon test interpretation. A burst can straddle five-minute buckets. Network XML is selected by destination and time and must be correlated manually to avoid attributing unrelated connections. A script return code proves neither SIEM ingestion nor a successful detection.

The temporary account is removed in a `finally` block. If the process is killed or the VM crashes, check manually for the printed `soc...` account before rerunning. Retain the event evidence of account creation and removal.
