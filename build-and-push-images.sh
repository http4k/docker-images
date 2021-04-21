#!/bin/sh
set -eu
docker login

cd amazoncorretto-lambda-runtime
./build-and-push.sh
cd ..

cd amazonlinux-java-graal-ce-lambda-runtime
./build-and-push.sh
cd ..

