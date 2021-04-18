# amazoncorretto-lambda-runtime

This image builds a runtime ZIP file containing a cut-down JVM based on Amazon Corretto. It is designed to work with a ShadowJar containing an http4k AWS Lambda function.

Basic usage for an example project:
```shell
../gradlew :example:shadowJar
docker build --build-arg JAR=build/libs/example.jar . -t function
mkdir -p build
docker run --rm --entrypoint cat function function.zip > build/function.zip
```

It includes 2 script files:
- **bootstrap** - the standard bootstrap file used by the Aws Lambda runner. Detects and passes the lambda memory settings to the JVM. 
- **packageZip** - takes the input ShadowJar (renamed to function.jar), uses `jlink` to create a streamlined version of the Java runtime based on the required modules detected, and creates the function.zip package. 
