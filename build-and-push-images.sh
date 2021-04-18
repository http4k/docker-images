#!/bin/sh
set -euo pipefail
docker login
pushd amazonlinux-java-graal-ce-lambda-runtime
./build-and-push.sh
popd
pushd amazonlinux-java-lambda-runtime
./build-and-push.sh
popd