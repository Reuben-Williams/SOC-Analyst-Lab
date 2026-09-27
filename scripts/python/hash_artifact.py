"""Hash one explicitly selected local file. No upload or evidence collection."""
import argparse
import hashlib
from pathlib import Path

def sha256_file(path):
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("file", type=Path)
    args = parser.parse_args()
    try:
        print(sha256_file(args.file))
    except OSError as error:
        parser.exit(1, f"Unable to read file: {error.strerror}\n")

if __name__ == "__main__":
    main()
