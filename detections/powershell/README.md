# LAB-002 — PowerShell encoded command indicator

**Status: DRAFT / NOT VALIDATED.**

## Hypothesis
PowerShell or pwsh process command line contains an encoded-command switch.

## Required telemetry
Security event 4688 with process command-line auditing; command-line collection must be enabled.

## Queries
- [SPL](../../splunk/suspicious-powershell.spl)
- [KQL](../../sentinel-kql/encoded-powershell.kql)

## Triage
Record the account, host, UTC timestamps, source and initiating process where available. Correlate adjacent events and authorized administrative changes. Separate observations from assumptions; do not label an account compromised based on this detection alone.

## Benign explanations
Administrative scripts and software deployment tools.

## Limitations
Encoding is not proof of malicious intent. Shortened switches and other interpreters can evade this starter pattern. Do not execute a discovered encoded payload.

## Validation and evidence
NOT RUN. Follow [validation](../../VALIDATION.md). Evidence: NONE. Thresholds and exclusions require lab-specific review.
