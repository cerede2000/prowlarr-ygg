#!/bin/bash

mkdir -p /config/Definitions/Custom/

# Copy YGG-API indexer
echo "Installing YGG-API indexer definition..."
cp /app/indexer-definitions/ygg-api-download.yml /config/Definitions/Custom/

chown -R hotio:hotio /config/Definitions/
chmod -R 755 /config/Definitions/

echo "YGG-API indexer installed successfully"

# Execute the original entrypoint with all arguments
exec /init "$@"
