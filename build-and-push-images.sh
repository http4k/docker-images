#!/bin/bash
set -eu
docker login

JAVA_VERSIONS=("11.0.26" "17.0.14" "21.0.6" "24.0.0")

cd amazoncorretto-lambda-runtime
for java_version in "${JAVA_VERSIONS[@]}"; do
    echo "Building and pushing amazoncorretto-lambda-runtime $java_version"
    ./build-and-push.sh "$java_version"
done
cd ..

cd amazoncorretto-lambda-runtime-arm64
for java_version in "${JAVA_VERSIONS[@]}"; do
    echo "Building and pushing amazoncorretto-lambda-runtime-arm64 $java_version"
    ./build-and-push.sh "$java_version"
done
cd ..

GRAAL_JAVA_VERSIONS=("21.0.2" "24.0.0")
AWS_LINUX_VERSIONS=("2023.7.20250331.0" "2.0.20250321.0")

cd amazonlinux-java-graal-community-lambda-runtime
for java_version in "${GRAAL_JAVA_VERSIONS[@]}"; do
  for linux_version in "${AWS_LINUX_VERSIONS[@]}"; do
    echo "Building and pushing amazonlinux-java-graal-community-lambda-runtime $java_version $linux_version"
    ./build-and-push.sh "$java_version" "$linux_version"
  done
done
cd ..
