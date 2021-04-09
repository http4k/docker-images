#!/bin/sh
docker login
docker build -t http4k/amazonlinux-graal-ce-java11-lambda-runtime \
-t http4k/amazonlinux-graal-ce-java11-lambda-runtime:amazonlinux2018.03.0.20191014.0-graalce20.1.0 \
.
docker push http4k/amazonlinux-graal-ce-java11-lambda-runtime
