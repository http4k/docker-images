#!/bin/sh
set -euo pipefail
docker build -t http4k/amazonlinux-java11-lambda-runtime \
-t http4k/amazonlinux-java11-lambda-runtime:amazonlinux2018.03.0.20191014.0-graalce20.1.0 \
.
docker push http4k/amazonlinux-java11-lambda-runtime
