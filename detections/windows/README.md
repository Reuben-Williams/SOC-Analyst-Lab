# LAB-003 — Windows account creation

**Status: DRAFT / NOT VALIDATED.**

## Hypothesis
A user account was created and should be reviewed against authorized changes.

## Required telemetry
Security event 4720; user-account management auditing and ingestion.

## Queries
- [SPL](../../splunk/account-creation.spl)
- [KQL](../../sentinel-kql/account-creation.kql)

## Triage
Record the account, host, UTC timestamps, source and initiating process where available. Correlate adjacent events and authorized administrative changes. Separate observations from assumptions; do not label an account compromised based on this detection alone.

## Benign explanations
Expected provisioning and disposable lab accounts.

## Limitations
An account creation event alone does not establish privilege escalation or compromise.

## Validation and evidence
NOT RUN. Follow [validation](../../VALIDATION.md). Evidence: NONE. Thresholds and exclusions require lab-specific review.

## Current exercise evidence

The account-creation rule passed checks, conversion and synthetic positive/negative selection. Fresh event 4720 collection remains pending. See the [executed exercise](../../investigations/LAB-006-sigma-validation.md).
