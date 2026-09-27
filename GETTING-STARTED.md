# Your first lab artifact

1. Fill in the actual [lab inventory](architecture/README.md) using observed configuration.
2. Confirm that a known Windows Security event reaches your SIEM and record the fields you actually see.
3. Adapt one failed-logon query to that lab source. Use a disposable lab account and an authorized, harmless exercise; do not risk locking a real account.
4. Record expected versus observed results in [VALIDATION.md](VALIDATION.md), including a negative control and time-window boundaries.
5. Write your reasoning in the [investigation template](investigations/brute-force-investigation.md), then add sanitized screenshots.

## Local Git workflow

The local repository's `origin` points to `https://github.com/Reuben-Williams/SOC-Analyst-Lab.git`.

```text
git pull --ff-only
git switch -c lab/first-investigation
git status
git add <specific-reviewed-files>
git diff --cached
git commit -m "Document first lab investigation with reviewed evidence"
git push -u origin lab/first-investigation
```

Review every staged file and image before committing. Avoid broad staging commands when raw evidence is nearby. Future pushes need your own Git authentication; no token or credential is stored in this repository. If Git requests an identity, configure your preferred name and GitHub noreply email for this repository.

## Scaffold checks performed

- Internal relative Markdown links and requested directory presence were checked locally.
- Python and PowerShell hashing utilities matched the known SHA-256 of `abc` and rejected a nonexistent file.
- These checks do **not** validate SPL, KQL, Sigma conversion, ingestion, detection accuracy, or any lab incident.
- All detection validation remains **NOT RUN**; screenshots and investigation results remain absent.
