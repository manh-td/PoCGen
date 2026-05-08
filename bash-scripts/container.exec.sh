#!/bin/bash

NUM_CONTAINER=10

for i in $(seq 1 "$NUM_CONTAINER"); do
    idx=$((i - 1))

    # docker exec vea.container.$i bash -c "echo \$OPENAI_API_KEY"
    # docker exec vea.container.$i bash -c "rm -rf output/"
    # docker exec vea.container.$i bash -c "ls dataset/SecBench.js.cochran.$idx" &
    # docker exec vea.container.$i bash -c "ls dataset/SecBench.js.rest.$idx" &
    # docker exec vea.container.$i bash -c "node index.js pipeline -v dataset/SecBench.js.rest.$idx" &
    docker exec vea.container.$i bash -c "node index.js vfc-pipeline --vfcDataPath ./vfcs.predicted.json dataset/SecBench.js.rest.$idx" &

done

wait