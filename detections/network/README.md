# LAB-004 — Outbound network review

Synthetic control testing is documented in the [network exercise](../../investigations/LAB-004-network-review.md). Live source mapping and baseline verification remain pending because no Sysmon network event 3 data was observed.

The exercise flags five outbound TCP connections per five-minute group to a port outside an illustrative allowlist. This is a review heuristic, not proof of maliciousness. The allowlist is a teaching fixture, not a real environment baseline. See the report for screenshots, the executed query, false positives and completion criteria.
