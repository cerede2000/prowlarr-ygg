#!/bin/bash

mkdir -p /config/Definitions/Custom/

# Copy YGG-API indexer if it doesn't already exist in the mounted volume
if [ ! -f "/config/Definitions/Custom/ygg-api-download.yml" ]; then
    echo "Installing YGG-API indexer definition..."
    cp /app/indexer-definitions/ygg-api-download.yml /config/Definitions/Custom/
    
    chown -R hotio:hotio /config/Definitions/
    chmod -R 755 /config/Definitions/
    
    echo "YGG-API indexer installed successfully"
else
    echo "YGG-API indexer already exists, skipping installation"
fi

# Execute the original entrypoint with all arguments
exec /init "$@"