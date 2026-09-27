# SOC Analyst Lab

A growing security operations portfolio by Reuben Williams: detection hypotheses, repeatable investigations, incident reporting, and small analyst utilities.

**Current status: starter portfolio. All detections are drafts and have not been run against lab telemetry. No completed investigations or incident outcomes are claimed.**

## Start here

1. Document the actual environment in [architecture](architecture/README.md). The diagram is a proposed design, not a verified deployment.
2. Start with [repeated failed logons](detections/authentication/README.md). Confirm your log sources and field mappings before running its query.
3. Follow the [validation checklist](VALIDATION.md), recording positive and negative results, limitations, and the exact query revision.
4. Use an [investigation template](investigations/brute-force-investigation.md) to explain the evidence and your reasoning.
5. Publish only reviewed, sanitized lab evidence using the [evidence guide](evidence/README.md).

## Portfolio map

| Area | Contents | Status |
| --- | --- | --- |
| [Windows](detections/windows/README.md) | Account creation review | Draft |
| [Authentication](detections/authentication/README.md) | Repeated failed logons | Draft |
| [PowerShell](detections/powershell/README.md) | Encoded command-line indicator | Draft |
| [Network](detections/network/README.md) | Outbound connection review template | Planned |
| [Splunk](splunk/README.md) | SPL starter searches | Unvalidated |
| [Sentinel](sentinel-kql/README.md) | SecurityEvent KQL searches | Unvalidated |
| [Sigma](sigma/README.md) | Portable experimental rules | Unvalidated |
| [Python](scripts/python/README.md) / [PowerShell](scripts/powershell/README.md) | Local file SHA-256 utilities | See usage notes |
| [Investigations](investigations/README.md) | Three blank investigation templates | Not started |
| [Incident reports](incident-reports/IR-001-compromised-user.md) | Blank response report | Not started |

## What this portfolio will demonstrate

- Explain a detection hypothesis and its telemetry requirements.
- Separate suspicious behavior from proof of compromise.
- Correlate evidence, consider benign explanations, and document confidence.
- Make investigation work reproducible without exposing sensitive data.

The initial scaffold and starter content were prepared with AI assistance. Future write-ups should identify the work personally executed, changes made, and evidence supporting each claim.

## Data boundaries

Use only owned or explicitly authorized lab systems. Never include secrets, API keys, employer data, PHI, proprietary material, real credentials, or unreviewed log exports. Ignored local storage is a convenience, not a security boundary. See [SECURITY.md](SECURITY.md).
