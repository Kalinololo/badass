#!/bin/bash

FILES=("router_lmataris-1" "router_lmataris-2")

for FILE in "${FILES[@]}"; do
        docker exec -it "${FILE}" ash ${FILE}_multi
        echo "Container ${FILE} is now configured for multicast !"
done
