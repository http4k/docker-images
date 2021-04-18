#!/bin/sh
set -euo pipefail
export AWS_LINUX_VERSION=2018.03.0.20191014.0
export JAVA_VERSION=java11
export GRAAL_VERSION=21.0.0.2

docker build --build-arg AWS_LINUX_VERSION=$AWS_LINUX_VERSION \
--build-arg JAVA_VERSION=$JAVA_VERSION \
--build-arg GRAAL_VERSION=$GRAAL_VERSION \
-t http4k/amazonlinux-graal-ce-java-lambda-runtime \
-t http4k/amazonlinux-java-graal-ce-lambda-runtime:amazonlinux$AWS_LINUX_VERSION-$JAVA_VERSION-graalce$GRAAL_VERSION \
.
docker push http4k/amazonlinux-java-graal-ce-lambda-runtime
