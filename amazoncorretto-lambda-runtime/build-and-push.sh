#!/bin/sh
set -eu
export AMAZON_CORRETTO_VERSION=11
docker build --build-arg AMAZON_CORRETTO_VERSION=$AMAZON_CORRETTO_VERSION \
-t http4k/amazoncorretto-lambda-runtime \
-t http4k/amazoncorretto-lambda-runtime:latest \
-t http4k/amazoncorretto-lambda-runtime:amazoncorretto$AMAZON_CORRETTO_VERSION \
.
docker push -a http4k/amazoncorretto-lambda-runtime
