#!/bin/sh
set -eu
export AMAZON_CORRETTO_VERSION=$1
export MAJOR_VERSION="${AMAZON_CORRETTO_VERSION%%.*}"

docker build --platform linux/arm64 --build-arg AMAZON_CORRETTO_IMAGE=arm64v8/amazoncorretto:$AMAZON_CORRETTO_VERSION \
-t http4k/amazoncorretto-lambda-runtime-arm64 \
-t http4k/amazoncorretto-lambda-runtime-arm64:latest \
-t http4k/amazoncorretto-lambda-runtime-arm64:amazoncorretto$MAJOR_VERSION \
-t http4k/amazoncorretto-lambda-runtime-arm64:amazoncorretto$AMAZON_CORRETTO_VERSION \
.

docker push -a http4k/amazoncorretto-lambda-runtime-arm64
