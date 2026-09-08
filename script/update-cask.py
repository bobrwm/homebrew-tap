import os
from pathlib import Path
import re

version = os.environ["VERSION"]
artifact = os.environ["ARTIFACT"]
checksum = os.environ["ARTIFACT_SHA256"]

if not re.fullmatch(r"[0-9]+\.[0-9]+\.[0-9]+-main\.[0-9]+\.[0-9]+", version):
    raise SystemExit("invalid version")

if not re.fullmatch(r"bobrwm-tip-[0-9]+-[0-9]+-aarch64-macos\.zip", artifact):
    raise SystemExit("invalid artifact name")

if not re.fullmatch(r"[0-9a-f]{64}", checksum):
    raise SystemExit("invalid sha256")

path = Path(__file__).resolve().parents[1] / "Casks/bobrwm.rb"
cask = path.read_text()
current = re.search(r'^  version "([0-9]+\.[0-9]+\.[0-9]+-main\.[0-9]+\.[0-9]+)"$', cask, re.MULTILINE)
if current:
    incoming_key = tuple(map(int, re.findall(r"\d+", version)))
    current_key = tuple(map(int, re.findall(r"\d+", current[1])))
    if incoming_key <= current_key:
        raise SystemExit("version is already published or older than the current cask")

fields = {
    "url": f"https://github.com/bobrwm/bobrwm/releases/download/tip/{artifact}",
    "version": version,
    "sha256": checksum,
}

for field, value in fields.items():
    cask, count = re.subn(rf'^  {field} ".*"$', f'  {field} "{value}"', cask, flags=re.MULTILINE)
    if count != 1:
        raise SystemExit(f"expected one {field} stanza")

path.write_text(cask)
