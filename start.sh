#!/bin/bash

set -e

cd /data

echo "eula=true" > eula.txt

if [[ -n "$OPS" ]]; then
    echo $OPS | awk -v RS=, '{print}' >> ops.txt
fi

java -server $JVM_OPTS -jar /data/forge-1.12.2-14.23.5.2838-universal.jar nogui
