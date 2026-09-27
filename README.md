# SOC Analyst Lab

A growing security operations portfolio by Reuben Williams: detection hypotheses, repeatable investigations, incident reporting, and small analyst utilities.

**Current status: historical reviews, synthetic SPL controls, Sigma checks/conversion/fixture tests, KQL static analysis, and an incident assessment are documented. Fresh endpoint collection, end-to-end alert validation, and Sentinel execution remain incomplete. No compromise or remediation outcome is claimed.**

## Documented exercises

- [Telemetry coverage and limitations](investigations/LAB-000-telemetry-coverage.md): actual source mapping and missing Windows events.
- [Historical SSH review](investigations/LAB-005-historical-ssh-review.md): 17 failures in six groups; separate ten-versus-nine synthetic boundary test passed.
- [Historical PowerShell review](investigations/LAB-002-historical-powershell-review.md): ten process events, zero pattern matches; four synthetic tests passed.
- [Initial environment observation](investigations/LAB-000-environment-readiness.md): sanitized VM inventory screenshot.
- [Windows authentication controls](investigations/brute-force-investigation.md): ten-versus-nine threshold and success-event exclusion.
- [Network review controls](investigations/LAB-004-network-review.md): synthetic outbound review, baseline and inbound cases.
- [Sigma validation](investigations/LAB-006-sigma-validation.md): official checks, Wazuh mapping, generated-query tests.
- [KQL static analysis](investigations/LAB-007-kql-static-validation.md): zero query diagnostics against a modeled schema; no Sentinel execution.
- [Incident assessment](incident-reports/IR-001-compromised-user.md): evidence, uncertainty, actual actions and remaining work.

These exercises use existing Wazuh alerts and explicitly labeled in-memory fixtures. They do not represent fresh attack simulations or completed end-to-end detection deployment. Reports include actual screenshots and reproducible queries.

1. Document the actual environment in [architecture](architecture/README.md). The diagram is a proposed design, not a verified deployment.
2. Start with [repeated failed logons](detections/authentication/README.md). Confirm your log sources and field mappings before running its query.
3. Follow the [validation checklist](VALIDATION.md), recording positive and negative results, limitations, and the exact query revision.
4. Review the [documented investigations](investigations/README.md) for evidence, reasoning and limitations.
5. Publish only reviewed, sanitized lab evidence using the [evidence guide](evidence/README.md).

## Portfolio map

| Area | Verified work and evidence | Still required |
| --- | --- | --- |
| [Windows](detections/windows/README.md) | Generated account query selects the positive fixture and excludes deletion/wrong-provider controls | Fresh 4720 event and SIEM ingestion |
| [Authentication](detections/authentication/README.md) | Windows fixture controls pass; historical SSH review completed | Fresh 4625 sequence, field checks and alert operation |
| [PowerShell](detections/powershell/README.md) | Ten historical processes reviewed; SPL and Sigma fixture tests pass | Fresh endpoint execution, ingestion and alert operation |
| [Network](detections/network/README.md) | Synthetic review/baseline/inbound controls tested in Splunk | Network source, observed baseline and owned-destination connection evidence |
| [Splunk](splunk/README.md) | Wazuh field mapping, historical queries and synthetic tests with screenshots | Raw-Windows starters and scheduled detection deployment |
| [Sentinel](sentinel-kql/README.md) | Three queries pass Microsoft Kusto.Language syntax/semantic analysis | Owned workspace, KQL execution and connector validation |
| [Sigma](sigma/README.md) | Two rules pass checks and conversion; generated predicates pass fixtures | Fresh end-to-end validation; rules remain experimental |
| [Python](scripts/python/README.md) / [PowerShell](scripts/powershell/README.md) | Hash utilities pass known-answer/error checks; endpoint harness is syntax-checked | Execute the harness inside the owned VM and review results |
| [Investigations](investigations/README.md) | Historical reviews, control tests, process/account assessments and coverage reports written | Fresh evidence and resolution of documented gaps |
| [Incident report](incident-reports/IR-001-compromised-user.md) | Bounded historical assessment completed; uncertainty and actual actions documented | No live response exercise or confirmed incident closure |
| [Architecture](architecture/README.md) | VM inventory and Wazuh dataset observed | Current forwarding route, isolation and memory-constrained collection |

## To finish live validation

The automation session cannot manage elevated Hyper-V or access the Windows guest. The owned guest must be opened and signed in by the operator. A [guarded endpoint exercise](scripts/powershell/Run-WindowsLabTests.md) is prepared but has not run. No Sentinel workspace is accessible to this task. These are open prerequisites, not completed lab steps.

The Wazuh manager may be required between the endpoint and Splunk. Choose VM uptime only after verifying that route; historical searches do not prove that the two-VM arrangement can collect fresh events.

## What this portfolio will demonstrate

- Explain a detection hypothesis and its telemetry requirements.
- Separate suspicious behavior from proof of compromise.
- Correlate evidence, consider benign explanations, and document confidence.
- Make investigation work reproducible without exposing sensitive data.

The initial scaffold and starter content were prepared with AI assistance. Future write-ups should identify the work personally executed, changes made, and evidence supporting each claim.

## Data boundaries

Use only owned or explicitly authorized lab systems. Never include secrets, API keys, employer data, PHI, proprietary material, real credentials, or unreviewed log exports. Ignored local storage is a convenience, not a security boundary. See [SECURITY.md](SECURITY.md).
