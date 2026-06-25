#!/usr/bin/env bash

set -euo pipefail

NUM_CONTAINER=10
IMAGE="gen-poc_mnt:latest"

CPU_LIMIT="2"
CPU_SHARES="256"
MEMORY_LIMIT="8g"
MEMORY_SWAP_LIMIT="8g"
PIDS_LIMIT="512"

for i in $(seq 1 "$NUM_CONTAINER"); do
  container_name="vea.container.$i"

  docker rm -f "$container_name" >/dev/null 2>&1 || true

  docker run -d \
    --init \
    --cpus="$CPU_LIMIT" \
    --cpu-shares="$CPU_SHARES" \
    --memory="$MEMORY_LIMIT" \
    --memory-swap="$MEMORY_SWAP_LIMIT" \
    --pids-limit="$PIDS_LIMIT" \
    -v "$(pwd):/app" \
    -w /app \
    -u root \
    --env-file .env \
    --name "$container_name" \
    "$IMAGE" \
    /bin/bash -c 'sleep infinity' &
done

wait