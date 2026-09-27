# LAB-001 — Repeated failed Windows logons

**Status: DRAFT / NOT VALIDATED.**

## Hypothesis
Ten or more failed logons for one account, source IP and host in a fixed five-minute bucket.

## Required telemetry
Windows Security event 4625; failed-logon auditing and ingestion must be enabled.

## Queries
- [SPL](../../splunk/brute-force.spl)
- [KQL](../../sentinel-kql/brute-force.kql)

## Triage
Record the account, host, UTC timestamps, source and initiating process where available. Correlate adjacent events and authorized administrative changes. Separate observations from assumptions; do not label an account compromised based on this detection alone.

## Benign explanations
Mistyped passwords, stale service credentials, test activity.

## Limitations
This is a threshold heuristic, not proof of brute force. Buckets can split a burst; distributed attempts, missing IPs and low-volume attempts may be missed.

## Validation and evidence
NOT RUN. Follow [validation](../../VALIDATION.md). Evidence: NONE. Thresholds and exclusions require lab-specific review.
