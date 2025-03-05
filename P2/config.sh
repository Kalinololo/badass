#!/bin/bash

FILES=("host_lmataris-1" "host_lmataris-2" "router_lmataris-1" "router_lmataris-2")

for FILE in "${FILES[@]}"; do
        docker exec -it "${FILE}" ash ${FILE}
        echo "Container ${FILE} is now configured !"
done
