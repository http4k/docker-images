# http4k/amazonlinux-java-graal-ce-lambda-runtime

This image builds a runtime ZIP file containing a Java GraalVM binary for Amazon Linux. It is designed to work with a ShadowJar containing an http4k AWS Lambda function and, given a tasteful selection of technologies, should not require any customisation of the GraalVM configuration.

Basic usage for an example project:
```shell
../gradlew :example:shadowJar
docker build --build-arg JAR=build/libs/example.jar . -t function
mkdir -p build
docker run --rm --entrypoint cat function function.zip > build/function.zip
```

It includes 2 script files:
- **bootstrap** - the standard bootstrap file used by the Aws Lambda runner. Detects and passes the lambda memory settings to the JVM.
- **packageZip** - takes the input ShadowJar (renamed to function.jar), uses `native-image` to create a native binary, and creates the function.zip package. 
