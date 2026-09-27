# LAB-007 — KQL static validation

**Completed:** syntax and semantic analysis of three starter queries. **Not completed:** query execution in Microsoft Sentinel or an Azure Data Explorer engine, ingestion, analytics rules, or alert delivery.

## Method and actual result

On 2026-09-27, Microsoft's `Microsoft.Azure.Kusto.Language` NuGet package version **12.4.1** was downloaded from the official NuGet registry into an isolated work directory. `KustoCode.ParseAndAnalyze` was called with an explicitly modeled `SecurityEvent` schema. `GetDiagnostics()` returned zero query diagnostics for each file:

| Query | Syntax/semantic diagnostics | Sentinel execution |
| --- | --- | --- |
| account-creation.kql | 0 | NOT RUN |
| brute-force.kql | 0 | NOT RUN |
| encoded-powershell.kql | 0 | NOT RUN |

Schema used:

```text
SecurityEvent(TimeGenerated:datetime, EventID:int, Computer:string,
TargetAccount:string, IpAddress:string, SubjectAccount:string,
NewProcessName:string, CommandLine:string)
```

The local host used .NET 10 with the package's .NET 6 assembly; compilation emitted assembly-version compatibility warnings. The analysis calls completed. Those host warnings are distinct from the zero query diagnostics.

## Reproduction

Use `GlobalState.Default.WithDatabase(new DatabaseSymbol("lab", new TableSymbol("SecurityEvent", "(TimeGenerated:datetime, EventID:int, Computer:string, TargetAccount:string, IpAddress:string, SubjectAccount:string, NewProcessName:string, CommandLine:string)")))`, then call `KustoCode.ParseAndAnalyze(query, globals).GetDiagnostics()` for each query. The schema is an explicit test model; it is not a live workspace introspection.

See [Microsoft's parser documentation](https://learn.microsoft.com/en-us/kusto/api/netfx/kusto-language-parse-queries?view=microsoft-fabric) and [SecurityEvent schema](https://learn.microsoft.com/en-us/azure/azure-monitor/reference/tables/securityevent).

## Remaining validation

Open an owned Sentinel workspace with the required connector and columns, run positive/negative fixtures in the KQL engine, inspect actual records and false positives, and document scheduling separately. A valid parse cannot prove event availability, runtime behavior, result correctness, cost, or latency. No workspace or paid resource was created in this exercise. AI assistance was used for the local analysis and report.
