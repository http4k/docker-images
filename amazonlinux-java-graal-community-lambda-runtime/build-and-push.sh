#!/bin/sh
set -eu
export AWS_LINUX_VERSION=2.0.20230119.1
export JAVA_VERSION=$1

docker build --build-arg AWS_LINUX_VERSION=$AWS_LINUX_VERSION \
--build-arg JAVA_VERSION="$JAVA_VERSION" \
-t http4k/amazonlinux-java-graal-community-lambda-runtime \
-t http4k/amazonlinux-java-graal-community-lambda-runtime:latest \
-t http4k/amazonlinux-java-graal-community-lambda-runtime:amazonlinux$AWS_LINUX_VERSION-"$JAVA_VERSION" .

docker push -a http4k/amazonlinux-java-graal-community-lambda-runtime
