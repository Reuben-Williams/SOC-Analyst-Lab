# Splunk starter searches

**All searches are unvalidated.** Replace `index=lab_windows` and `sourcetype="XmlWinEventLog:Security"` with your confirmed lab values. Never broaden to production data to make a query return results.

These examples assume extracted fields `EventCode`, `Computer`, `TargetUserName`, `TargetDomainName`, `IpAddress`, `NewProcessName`, `CommandLine`, `SubjectUserName`, and `SubjectDomainName`. They are not CIM queries. Add-on versions and event formats differ; inspect events first. Missing grouping fields can suppress results.

- `brute-force.spl`: event 4625, ten failures per fixed five-minute bucket; source, account and host scoped.
- `suspicious-powershell.spl`: event 4688 and a command-line indicator; requires command-line auditing.
- `account-creation.spl`: event 4720 review search, no maliciousness verdict.

Use a short lab time range first. No saved alerts or automated response actions are installed.

[Official SPL reference](https://docs.splunk.com/Documentation/SplunkCloud/latest/SearchReference/)
