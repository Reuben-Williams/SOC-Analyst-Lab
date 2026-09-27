# IR-001 — Lab authentication and process assessment

**Report status: completed for a limited historical review. Incident status: compromise not established. No containment or recovery performed.**

## Executive summary

On 2026-09-27, existing Wazuh alerts in the owned lab Splunk instance were reviewed for authentication and PowerShell indicators. Seventeen SSH authentication failures did not cross the selected per-group threshold. Ten historical PowerShell process events did not match the tested encoded-command pattern. Coverage gaps prevent a broader assurance or compromise finding.

This report documents a bounded lab investigation, not a resolved real-world intrusion. There is no supported business-impact estimate, root-cause attribution, or claim of successful remediation.

## Evidence and timeline

| Observation | Evidence |
| --- | --- |
| Initial VM state recorded | [Readiness](../investigations/LAB-000-environment-readiness.md) |
| Wazuh alert source and Windows coverage assessed | [Coverage assessment](../investigations/LAB-000-telemetry-coverage.md) |
| 17 SSH failures, six groups, no threshold breach | [SSH review and screenshots](../investigations/LAB-005-historical-ssh-review.md) |
| Ten PowerShell records, no tested indicator match | [PowerShell review and screenshots](../investigations/LAB-002-historical-powershell-review.md) |
| Synthetic detector controls executed separately | [Windows authentication](../investigations/brute-force-investigation.md), [Sigma tests](../investigations/LAB-006-sigma-validation.md) |

Historical events were not generated during this assessment. Report execution times and query windows are recorded in the linked reports. Synthetic tests are not corroborating evidence of an incident.

## Assessment and confidence

High confidence in the displayed query results for the scoped data; insufficient evidence for a compromise, malware, or absence-of-threat conclusion. The input is an alert-only dataset. Missing Windows 4625, 4720, 4688 and Sysmon 3 records, unknown forwarding health, and incomplete event context limit conclusions. Fixed buckets and illustrative thresholds introduce detection gaps.

## Response and follow-up

Actions actually taken: read-only searches, local rule checks/conversion, synthetic in-memory tests, screenshot capture and documentation. No account containment, credential rotation, endpoint isolation, sample execution, eradication or restoration was performed.

Recommended next steps: establish the live telemetry path with the fewest VMs needed; run the guarded endpoint exercise on the owned VM; verify positive and negative results; investigate contradictory evidence; then reassess any alert before taking response action. Assign ownership to the lab operator and retain raw evidence locally.

## Closure

The historical review and this report are complete within the stated scope. The full lab campaign is **not closed**: fresh endpoint validation, cloud KQL execution and scheduled-alert operation remain open. AI assistance was used for execution and writing; no claim of independent analyst employment experience is implied.
