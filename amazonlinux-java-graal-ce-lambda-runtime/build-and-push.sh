#!/bin/sh
set -eu
export AWS_LINUX_VERSION=2.0.20211001.0
export JAVA_VERSION=java11
export GRAAL_VERSION=21.3.0

docker build --build-arg AWS_LINUX_VERSION=$AWS_LINUX_VERSION \
--build-arg JAVA_VERSION=$JAVA_VERSION \
--build-arg GRAAL_VERSION=$GRAAL_VERSION \
-t http4k/amazonlinux-java-graal-ce-lambda-runtime \
-t http4k/amazonlinux-java-graal-ce-lambda-runtime:latest \
-t http4k/amazonlinux-java-graal-ce-lambda-runtime:amazonlinux$AWS_LINUX_VERSION-$JAVA_VERSION-graalce$GRAAL_VERSION .

docker push -a http4k/amazonlinux-java-graal-ce-lambda-runtime
