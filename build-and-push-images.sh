#!/bin/bash
set -eu
docker login

JAVA_VERSIONS=("11.0.18" "17.0.6" "19.0.2" "21.0.0")

cd amazoncorretto-lambda-runtime
for version in "${JAVA_VERSIONS[@]}"; do
    ./build-and-push.sh "$version"
done
cd ..

cd amazoncorretto-lambda-runtime-arm64
for version in "${JAVA_VERSIONS[@]}"; do
    ./build-and-push.sh "$version"
done
cd ..

GRAAL_JAVA_VERSIONS=("21.0.0")

cd amazonlinux-java-graal-community-lambda-runtime
for version in "${GRAAL_JAVA_VERSIONS[@]}"; do
    ./build-and-push.sh "$version"
done
cd ..
