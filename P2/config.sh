#!/bin/bash

FILES=("host_lmataris-1" "host_lmataris-2" "router_lmataris-1" "router_lmataris-2")

for CONTAINER_ID in $(docker ps -q); do
    HOSTNAME=$(docker exec "$CONTAINER_ID" hostname)
    
    for FILE in "${FILES[@]}"; do
        if [ "$HOSTNAME" = "$FILE" ]; then
            docker exec -it "$CONTAINER_ID" ash $FILE
            echo "Container $FILE (ID: $CONTAINER_ID) is now configured!"
            break
        fi
    done
done