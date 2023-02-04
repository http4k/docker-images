#!/bin/sh
set -eu
docker login

JAVA_VERSIONS=("11.0.18" "17.0.6" "19.0.2")
GRAAL_JAVA_VERSIONS=("java11" "java17" "java19")

cd amazoncorretto-lambda-runtime
for version in "${JAVA_VERSIONS[@]}"; do
    ./build-and-push.sh $$version
done
cd ..

cd amazoncorretto-lambda-runtime-arm64
for version in "${JAVA_VERSIONS[@]}"; do
    ./build-and-push.sh $$version
done
cd ..

cd amazonlinux-java-graal-ce-lambda-runtime
for version in "${JAVA_VERSIONS[@]}"; do
    ./build-and-push.sh $$version
done
cd ..
