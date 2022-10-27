#!/bin/sh
set -eu
docker login

cd amazoncorretto-lambda-runtime
./build-and-push.sh 11.0.17
./build-and-push.sh 17.0.5
./build-and-push.sh 19.0.1
cd ..

cd amazonlinux-java-graal-ce-lambda-runtime
./build-and-push.sh java11
./build-and-push.sh java17
./build-and-push.sh java19
cd ..

