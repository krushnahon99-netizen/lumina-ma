#!/usr/bin/env bash
# Zips datapack/manhunt-ai into public/manhunt-ai.zip (HANDOFF.md is bundled so the zip alone restores the project).
# If a local test server exists at $MC_DIR (default /tmp/mc), the zip is copied into its world too.
set -e
cd "$(dirname "$0")/.."
ROOT=$(pwd)
rm -f public/manhunt-ai.zip
(cd datapack/manhunt-ai && zip -qr "$ROOT/public/manhunt-ai.zip" pack.mcmeta data)
[ -f HANDOFF.md ] && zip -qj public/manhunt-ai.zip HANDOFF.md
MC=${MC_DIR:-/tmp/mc}
[ -d "$MC/world/datapacks" ] && cp public/manhunt-ai.zip "$MC/world/datapacks/manhunt-ai.zip"
unzip -l public/manhunt-ai.zip | tail -1
