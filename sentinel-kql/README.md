# Microsoft Sentinel KQL exercises

The three `SecurityEvent` starters passed Microsoft's Kusto.Language 12.4.1 syntax and semantic checks against an explicitly modeled schema, with zero query diagnostics. **They have not been executed in Sentinel.** See [LAB-007](../investigations/LAB-007-kql-static-validation.md).

These queries target `SecurityEvent`, not `WindowsEvent`, Defender `DeviceProcessEvents`, or Entra `SigninLogs`. Confirm connector configuration, column population, UTC windows and retention before running them. No cloud workspace, analytics rule, schedule, or response action was created.
