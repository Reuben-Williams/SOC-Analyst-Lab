# Local artifact hashing

Run `./scripts/powershell/Get-ArtifactHash.ps1 -Path ./evidence/screenshots/reviewed-file.png` in PowerShell from the repository root. Pass an existing file. The script reads only that file and prints its SHA-256 digest.

Use PowerShell 5.1 or newer. Follow your existing execution policy; do not weaken system protections to run this utility. No event-log collection or network calls are performed. A hash does not validate an investigation.
