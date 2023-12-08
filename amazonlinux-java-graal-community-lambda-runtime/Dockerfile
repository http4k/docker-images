# install base linux + tools
ARG AWS_LINUX_VERSION=2.0.20230912.0
FROM amazonlinux:$AWS_LINUX_VERSION

RUN yum install -y gcc gcc-c++ libc6-dev binutils zlib1g-dev curl bash zlib zlib-devel tar zip gzip

# get graal...
ARG JAVA_VERSION=jdk-21.0.0
ARG ARCH=aarch64
ENV LANG=en_US.UTF-8
ENV GRAAL_FILENAME=graalvm-community-${JAVA_VERSION}_linux-${ARCH}_bin.tar.gz
ENV GRAAL_URL=https://github.com/graalvm/graalvm-ce-builds/releases/download/${JAVA_VERSION}/${GRAAL_FILENAME}
RUN echo $GRAAL_URL
RUN curl -4 -L $GRAAL_URL -o /tmp/${GRAAL_FILENAME}

# extract file to /tmp directory, then search for single added folder and move that
# this only works if the tar extracts 1 folder, not more than that
# this is needed because the graal filename is not the same as the extracted directory
RUN tar -zxvf /tmp/${GRAAL_FILENAME} -C /tmp && \
    EXTRACTED_DIR=$(find /tmp -mindepth 1 -maxdepth 1 -type d -cnewer /tmp/${GRAAL_FILENAME}) && \
        mv "$EXTRACTED_DIR" /usr/lib/graalvm
RUN rm -rf /tmp/*

# add lambda runtime bootstrap script
COPY bootstrap .
RUN chmod 777 bootstrap

# add script to create native executable and zip it
COPY packageZip .
RUN chmod 777 packageZip

# set entry point script - this takes 2 args:
# 1. the input UberJar
# 2. the path to the output ZIP (optional, defaults to function.zip)
ENTRYPOINT ["./packageZip"]