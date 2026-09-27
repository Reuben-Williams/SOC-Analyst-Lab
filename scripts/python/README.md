# Local artifact hashing

Run `python scripts/python/hash_artifact.py path/to/reviewed-file.png` from the repository root. Requires Python 3; standard library only. Prints a SHA-256 digest and does not transmit data or alter the file.

Use it to record the exact published artifact bytes. A digest does not prove authenticity, chain of custody, or detection validity. Review and sanitize the file before publication.
