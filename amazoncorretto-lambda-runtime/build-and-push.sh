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

docker build --build-arg AMAZON_CORRETTO_IMAGE=amd64/amazoncorretto:$AMAZON_CORRETTO_VERSION \
-t http4k/amazoncorretto-lambda-runtime-amd64 \
-t http4k/amazoncorretto-lambda-runtime-amd64:latest \
-t http4k/amazoncorretto-lambda-runtime-amd64:amazoncorretto$MAJOR_VERSION \
-t http4k/amazoncorretto-lambda-runtime-amd64:amazoncorretto$AMAZON_CORRETTO_VERSION \
.

docker push -a http4k/amazoncorretto-lambda-runtime
