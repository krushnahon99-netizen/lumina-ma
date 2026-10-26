#!/usr/bin/env bash
# Downloads Java 21, a Fabric 1.21.11 server, Fabric API and HeroBot into $MC_DIR (default /tmp/mc)
# and writes a flat, offline-mode test world config with RCON on 25575 (password: test).
set -e
MC=${MC_DIR:-/tmp/mc}
VER=1.21.11
mkdir -p "$MC/mods" "$MC/world/datapacks"
cd "$MC"

if [ ! -x jre/bin/java ]; then
  curl -sL -o jre.tar.gz "https://api.adoptium.net/v3/binary/latest/21/ga/linux/x64/jre/hotspot/normal/eclipse"
  mkdir -p jre && tar -xzf jre.tar.gz -C jre --strip-components=1 && rm jre.tar.gz
fi

if [ ! -f server.jar ]; then
  LOADER=$(curl -s "https://meta.fabricmc.net/v2/versions/loader/$VER" | python3 -c "import sys,json;print(json.load(sys.stdin)[0]['loader']['version'])")
  INST=$(curl -s https://meta.fabricmc.net/v2/versions/installer | python3 -c "import sys,json;print(json.load(sys.stdin)[0]['version'])")
  curl -sL -o server.jar "https://meta.fabricmc.net/v2/versions/loader/$VER/$LOADER/$INST/server/jar"
fi

for p in fabric-api herobot; do
  [ -f "mods/$p.jar" ] && continue
  url=$(curl -s "https://api.modrinth.com/v2/project/$p/version?game_versions=%5B%22$VER%22%5D&loaders=%5B%22fabric%22%5D" | python3 -c "import sys,json;print(json.load(sys.stdin)[0]['files'][0]['url'])")
  curl -sL -o "mods/$p.jar" "$url"
done

echo "eula=true" > eula.txt
cat > server.properties <<'EOF'
online-mode=false
level-type=minecraft\:flat
enable-rcon=true
rcon.port=25575
rcon.password=test
broadcast-rcon-to-ops=false
spawn-protection=0
view-distance=4
simulation-distance=4
difficulty=normal
spawn-monsters=false
spawn-animals=false
generate-structures=false
gamemode=survival
sync-chunk-writes=false
server-port=25565
EOF

./jre/bin/java -version 2>&1 | head -1
ls mods
