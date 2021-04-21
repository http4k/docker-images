#!/bin/sh
set -eu
docker login

pushd amazoncorretto-lambda-runtime
./build-and-push.sh
popd

pushd amazonlinux-java-graal-ce-lambda-runtime
./build-and-push.sh
popd

