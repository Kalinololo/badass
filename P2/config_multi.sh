#!/bin/bash

FILES=("router_lmataris-1" "router_lmataris-2")

for CONTAINER_ID in $(docker ps -q); do
    HOSTNAME=$(docker exec "$CONTAINER_ID" hostname)
    
    for FILE in "${FILES[@]}"; do
        if [ "$HOSTNAME" = "$FILE" ]; then
            docker cp ${FILE}_multi $CONTAINER_ID:/
            docker exec -it "$CONTAINER_ID" ash ${FILE}_multi
            echo "Container $FILE (ID: $CONTAINER_ID) is now configured for multicast!"
            break
        fi
    done
done