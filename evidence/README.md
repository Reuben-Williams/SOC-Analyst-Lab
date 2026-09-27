# Evidence publishing guide

A sanitized VM inventory screenshot is available in [LAB-000](../investigations/LAB-000-environment-readiness.md). No event data or detection-result screenshots have been collected. Store raw material outside Git or in ignored `local-only/`.

After review, place sanitized screenshots in `evidence/screenshots/` and reference them from the investigation. Suggested name: `LAB-001-query-results-YYYYMMDD.png`.

For each artifact record: ID, UTC capture time, lab alias, query commit, what it demonstrates, redactions, limitations, and SHA-256 of the published file. Hashes identify file bytes; they do not establish provenance or validate findings.

Capture the query, time picker and relevant results. Use synthetic account names; remove secrets and unrelated personal or employer information. Do not commit empty or invented screenshots.
