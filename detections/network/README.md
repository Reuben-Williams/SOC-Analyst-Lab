# LAB-004 — Outbound connection review

**Status: PLANNED. No executable query or completed test is claimed.**

Hypothesis: an unusual destination or port warrants investigation when compared to the lab's known baseline.

Required source: choose Zeek connection logs or Sysmon event 3. Document source, destination, port, protocol, UTC time, and process mapping where available. Sysmon network logging depends on configuration.

Query template: choose an explicit source and time range; group by lab host, destination and port; count connections; compare against a documented baseline; inspect the process and DNS context. Set a threshold only after observing benign lab traffic.

False positives: updates, browsers, package managers, management tools. Limitations: NAT, incomplete capture, encryption, and absent baseline. A rare destination is not proof of command and control. Validation: NOT RUN. Evidence: NONE.
