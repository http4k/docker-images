#!/bin/sh
set -euo pipefail
docker login
pushd amazonlinux-graal-ce-java11-lambda-runtime
./build-and-push.sh
popd
pushd amazonlinux-java11-lambda-runtime
./build-and-push.sh
popd