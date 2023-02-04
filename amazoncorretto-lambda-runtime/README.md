# amazoncorretto-lambda-runtime / amazoncorretto-lambda-runtime-amd64

This image builds a runtime ZIP file containing a cut-down JVM based on Amazon Corretto for both x86 and AMD64 architectures. It is designed to work with a ShadowJar containing an http4k AWS Lambda function.

Basic usage for an example project. Arguments to the docker run command:
1. UBERJAR_PATH = path the UberJar. This is loaded from inside the container at source/<UBERJAR_PATH>
2. OUTPUT_ZIP_PATH (optional) = path to the output Zipfile. Defaults to source/function.zip

```shell
./gradlew shadowJar

# then...
docker run -v $(pwd):/source http4k/amazoncorretto-lambda-runtime:latest <UBERJAR_PATH> <OUTPUT_ZIP_PATH?>

# or...
docker run -v $(pwd):/source http4k/amazoncorretto-lambda-runtime-amd64:latest <UBERJAR_PATH> <OUTPUT_ZIP_PATH?>
```

The Docker image itself includes 2 script files loaded from this repo:
- **bootstrap** - the standard bootstrap file used by the Aws Lambda runner. Detects and passes the lambda memory settings to the JVM. 
- **packageZip** - takes the input ShadowJar from the location in the source directory, uses `jlink` to create a streamlined version of the Java runtime based on the required modules detected, and creates the output ZIP package. 

Images are hosted in [DockerHub](https://hub.docker.com/r/http4k)
