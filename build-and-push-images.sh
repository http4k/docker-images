#!/bin/sh
set -eu
docker login

export J11=11.0.18
export J17=17.0.6
export J19=19.0.2

cd amazoncorretto-lambda-runtime
./build-and-push.sh $J11
./build-and-push.sh $J17
./build-and-push.sh $J19
cd ..

cd amazoncorretto-lambda-runtime-amd64
./build-and-push.sh $J11
./build-and-push.sh $J17
./build-and-push.sh $J19
cd ..

cd amazonlinux-java-graal-ce-lambda-runtime
./build-and-push.sh java11
./build-and-push.sh java17
./build-and-push.sh java19
cd ..

