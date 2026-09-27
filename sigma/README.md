# Sigma detection exercises

Both rules passed official rule checks and conversion using the local [Wazuh pipeline](wazuh-splunk-pipeline.yml). The generated SPL predicates selected the expected cases in Splunk synthetic tests. See [LAB-006](../investigations/LAB-006-sigma-validation.md) for evidence, exact commands, limitations and screenshots.

Status remains `experimental`: fresh endpoint and scheduled-alert validation are not complete. Pinned validation tools are in [requirements-validation.txt](requirements-validation.txt). Install them into a separate environment; do not commit dependencies or credentials.
