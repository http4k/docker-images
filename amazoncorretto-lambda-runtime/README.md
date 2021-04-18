# amazoncorretto-lambda-runtime

This image builds a runtime ZIP file containing a cut-down JVM based on Amazon Corretto. It is designed to work with a ShadowJar containing an http4k AWS Lambda function.

Basic usage for an example project. The second argument to the docker command is optional:
```shell
./gradlew shadowJar
docker run -v $(pwd):/source \
http4k/amazoncorretto-lambda-runtime:latest build/libs/example.jar myfunction.zip
```

It includes 2 script files:
- **bootstrap** - the standard bootstrap file used by the Aws Lambda runner. Detects and passes the lambda memory settings to the JVM. 
- **packageZip** - takes the input ShadowJar from the location in the source directory, uses `jlink` to create a streamlined version of the Java runtime based on the required modules detected, and creates the output ZIP package. 
