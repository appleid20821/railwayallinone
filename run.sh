#!/bin/bash

echo "=== Starting All Services ==="

# Pawns.app
echo "Starting Pawns.app..."
pawns-cli -email=appleid20821@gmail.com -password='345LSMchxEFgW3@' -device-name=kata-server -accept-tos &

# ProxyRack POP
echo "Starting ProxyRack POP..."
curl -sL https://app-updates.sock.sh/peerclient/script/script.js -o script.js
VERSION=$(curl -sL https://app-updates.sock.sh/peerclient/script/version.txt)
node script.js --homeIp point-of-presence.sock.sh --homePort 443 --id 6fa30ed9-0ba0-4a2b-94ad-9a85bf8c324a --version $VERSION --clientKey proxyrack-pop-client --clientType PoP &

# Web Terminal
echo "Starting Web Terminal on port 2525..."
ttyd -p 2525 bash &

echo "=== All Services Started ==="

while true; do sleep 60; done
