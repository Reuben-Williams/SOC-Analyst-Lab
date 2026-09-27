# Experimental Sigma rules

These original starter rules are **experimental and unvalidated**. They have not been compiled with a backend or executed against lab logs. Choose a backend and processing pipeline matching your telemetry; generic `Image` and `CommandLine` fields require mapping.

The PowerShell rule is a simple substring heuristic and does not cover every switch spelling. Account creation is informational. Neither rule is proof of compromise. Review false positives and follow the validation checklist before claiming coverage.

[Sigma specification](https://sigmahq.io/sigma-specification/specification/sigma-rules-specification.html) · [Processing pipelines](https://sigmahq.io/docs/digging-deeper/pipelines)
