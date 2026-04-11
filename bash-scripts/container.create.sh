#!/bin/bash
NUM_CONTAINER=10
IMAGE="gen-poc_mnt:latest"

for i in $(seq 1 $NUM_CONTAINER); do
  docker run -d -it \
    -v "$(pwd):/app" \
    -u root \
    --env-file .env \
    --name vea.container.$i \
    $IMAGE /bin/bash &
done

wait
