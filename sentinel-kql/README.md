# Microsoft Sentinel KQL starters

**DRAFT / NOT VALIDATED.** These queries target the `SecurityEvent` table, not `WindowsEvent`, Defender `DeviceProcessEvents`, or Entra `SigninLogs`. They require the corresponding Windows audit events to be ingested.

Confirm field population and retention before use. Empty results may mean absent telemetry or a wrong connector rather than an absence of suspicious activity. The failed-logon query uses fixed five-minute buckets and an illustrative threshold of ten. No analytics rule scheduling, suppression or response actions are configured.

[Official SecurityEvent schema](https://learn.microsoft.com/en-us/azure/azure-monitor/reference/tables/securityevent)
