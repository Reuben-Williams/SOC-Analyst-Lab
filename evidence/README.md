# Evidence publishing guide

Sanitized screenshots document the VM inventory, historical SSH and PowerShell review results, Windows telemetry coverage, and explicitly labeled synthetic tests. Refer to the [coverage assessment](../investigations/LAB-000-telemetry-coverage.md) and linked investigation reports. No raw event exports are published. Store raw material outside Git or in ignored `local-only/`.

After review, place sanitized screenshots in `evidence/screenshots/` and reference them from the investigation. Suggested name: `LAB-001-query-results-YYYYMMDD.png`.

For each artifact record: ID, UTC capture time, lab alias, query commit, what it demonstrates, redactions, limitations, and SHA-256 of the published file. Hashes identify file bytes; they do not establish provenance or validate findings.

Capture the query, time picker and relevant results. Use synthetic account names; remove secrets and unrelated personal or employer information. Do not commit empty or invented screenshots.
