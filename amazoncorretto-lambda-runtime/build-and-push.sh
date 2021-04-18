#!/bin/sh
set -euo pipefail
export AMAZON_CORRETTO_VERSION=11
docker build -t http4k/amazoncorretto-lambda-runtime \
--build-arg AMAZON_CORRETTO_VERSION=$AMAZON_CORRETTO_VERSION \
-t http4k/amazoncorretto-lambda-runtime:amazoncorretto$AMAZON_CORRETTO_VERSION \
.
docker push http4k/amazoncorretto-lambda-runtime
