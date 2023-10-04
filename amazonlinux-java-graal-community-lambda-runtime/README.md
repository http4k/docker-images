# http4k/amazonlinux-java-graal-ce-lambda-runtime

This image builds a runtime ZIP file containing a Java GraalVM binary for Amazon Linux. It is designed to work with a ShadowJar containing an http4k AWS Lambda function and, given a tasteful selection of technologies, should not require any customisation of the GraalVM configuration.

Basic usage for an example project. Arguments to the docker run command:
1. UBERJAR_PATH = path the UberJar. This is loaded from inside the container at source/<UBERJAR_PATH>
2. OUTPUT_ZIP_PATH (optional) = path to the output Zipfile. Defaults to source/function.zip

```shell
./gradlew shadowJar
docker run -v $(pwd):/source \
http4k/amazonlinux-java-graal-ce-lambda-runtime:latest <UBERJAR_PATH> <OUTPUT_ZIP_PATH?>
```

The Docker image itself includes 2 script files loaded from this repo:
- **bootstrap** - the standard bootstrap file used by the Aws Lambda runner. Detects and passes the lambda memory settings to the JVM.
- **packageZip** - takes the input ShadowJar (renamed to function.jar), uses `native-image` to create a native binary, and creates the function.zip package. 

Images are hosted in [DockerHub](https://hub.docker.com/r/http4k)
