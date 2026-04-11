#!/bin/bash

NUM_CONTAINER=10

for i in $(seq 1 $NUM_CONTAINER); do
  docker rm -f vea.container.$i &
done

wait