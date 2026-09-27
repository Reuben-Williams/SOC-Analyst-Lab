# Publication and evidence boundaries

- Use synthetic identities and lab-only systems. Do not copy production or employer records.
- Keep raw exports outside this repository, or in ignored `local-only/`. Never force-add them.
- Before committing, review the staged diff and every image. Remove credentials, tokens, cookies, personal email addresses, public IPs, identifying hostnames, and unrelated browser tabs.
- Redaction must remove pixels/content permanently; a movable overlay is insufficient. Inspect the exported result and metadata.
- Never upload PHI, patient records, proprietary content, or employer data, even as examples.
- A `.gitignore` does not inspect content, remove tracked files, or erase history.
- If a secret is committed, revoke/rotate it promptly and follow GitHub's sensitive-data removal guidance. Deleting the current file alone is insufficient.

No scripts here upload evidence, change system settings, execute attack payloads, or collect logs automatically. Do not paste sensitive examples into public issues.
