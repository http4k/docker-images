#!/bin/sh
set -eu
export AMAZON_CORRETTO_VERSION=$1
export MAJOR_VERSION="${AMAZON_CORRETTO_VERSION%%.*}"

docker build --build-arg AMAZON_CORRETTO_IMAGE=amazoncorretto:$AMAZON_CORRETTO_VERSION \
-t http4k/amazoncorretto-lambda-runtime \
-t http4k/amazoncorretto-lambda-runtime:latest \
-t http4k/amazoncorretto-lambda-runtime:amazoncorretto$MAJOR_VERSION \
-t http4k/amazoncorretto-lambda-runtime:amazoncorretto$AMAZON_CORRETTO_VERSION \
.

docker push -a http4k/amazoncorretto-lambda-runtime

docker build --build-arg AMAZON_CORRETTO_IMAGE=arm64v8/amazoncorretto:$AMAZON_CORRETTO_VERSION \
-t http4k/amazoncorretto-lambda-runtime-arm64v8 \
-t http4k/amazoncorretto-lambda-runtime-arm64v8:latest \
-t http4k/amazoncorretto-lambda-runtime-arm64v8:amazoncorretto$MAJOR_VERSION \
-t http4k/amazoncorretto-lambda-runtime-arm64v8:amazoncorretto$AMAZON_CORRETTO_VERSION \
.

docker push -a http4k/amazoncorretto-lambda-runtime-arm64v8
