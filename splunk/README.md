# Splunk starter searches

**The original Windows starter searches remain unvalidated.** Replace `index=lab_windows` and `sourcetype="XmlWinEventLog:Security"` with your confirmed lab values. Never broaden to production data to make a query return results.

The added `wazuh-*` review queries were executed against historical Wazuh alerts on 2026-09-27. The `*-validation.spl` queries were run only on synthetic in-memory fixtures. See the linked [SSH report](../investigations/LAB-005-historical-ssh-review.md), [PowerShell report](../investigations/LAB-002-historical-powershell-review.md), and [coverage assessment](../investigations/LAB-000-telemetry-coverage.md) for exact outcomes and limitations. No fresh endpoint collection or saved-alert deployment is validated by these tests.

These examples assume extracted fields `EventCode`, `Computer`, `TargetUserName`, `TargetDomainName`, `IpAddress`, `NewProcessName`, `CommandLine`, `SubjectUserName`, and `SubjectDomainName`. They are not CIM queries. Add-on versions and event formats differ; inspect events first. Missing grouping fields can suppress results.

- `brute-force.spl`: event 4625, ten failures per fixed five-minute bucket; source, account and host scoped.
- `suspicious-powershell.spl`: event 4688 and a command-line indicator; requires command-line auditing.
- `account-creation.spl`: event 4720 review search, no maliciousness verdict.

Use a short lab time range first. No saved alerts or automated response actions are installed.

## Additional completed fixture tests

- [Windows authentication](../investigations/brute-force-investigation.md): ten-versus-nine failures and successful-logon exclusion.
- [Network controls](../investigations/LAB-004-network-review.md): outbound review, baseline and inbound controls.
- [Generated Sigma predicates](../investigations/LAB-006-sigma-validation.md): account creation and encoded PowerShell with negative controls.

Each report links the exact executed SPL and genuine application screenshots. These fixtures validate only the documented inputs, not fresh endpoint collection or a scheduled alert.

[Official SPL reference](https://docs.splunk.com/Documentation/SplunkCloud/latest/SearchReference/)
