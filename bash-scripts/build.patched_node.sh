#!/bin/bash

pushd patched_node
docker build -t patched_node -f patched_node.Dockerfile .
popd