# Detection validation record

**Status: NOT RUN.** Copy this record for each lab exercise; unchecked items are not evidence of completion.

This file is a blank template. Separate scoped results now exist for the [SSH historical review and synthetic threshold test](investigations/LAB-005-historical-ssh-review.md) and [PowerShell historical review and synthetic matching tests](investigations/LAB-002-historical-powershell-review.md). Neither establishes end-to-end deployment validation.

- Detection ID / query path / commit: TODO
- Date, time range, timezone (prefer UTC): TODO
- Lab-only scope and authorization: TODO
- SIEM version, index/table, source and ingestion configuration: TODO
- Actual field mappings and required audit settings: TODO
- Benign positive test action or synthetic fixture: TODO
- Negative control and expected outcome: TODO
- Expected matches / observed matches: TODO / NOT RUN
- False positives, missing events, and boundary cases: TODO
- Screenshot and sanitized event references: NONE
- Analyst conclusion and confidence: NOT ASSESSED

## Checklist

- [ ] Confirm ingestion and timestamps using a known lab event.
- [ ] Inspect raw field names before adapting the query.
- [ ] Record a harmless positive test and a negative control.
- [ ] Check threshold, missing-field and time-window edge cases.
- [ ] Compare actual results to expectations; explain discrepancies.
- [ ] Review benign administrative activity and document tuning.
- [ ] Publish sanitized evidence and exact query revision.

Use manual searches first. Scheduling, alert grouping, suppression, and response actions are not configured by this repository. A synthetic test proves only behavior on that fixture; it does not validate a live deployment.
