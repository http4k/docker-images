# install base linux + tools
ARG AWS_LINUX_VERSION=2.0.20230119.1
FROM amazonlinux:$AWS_LINUX_VERSION

RUN yum install -y gcc gcc-c++ libc6-dev binutils zlib1g-dev curl bash zlib zlib-devel tar zip gzip

# get graal...
ARG JAVA_VERSION=jdk-21.0.0
ENV LANG=en_US.UTF-8
ENV GRAAL_FILENAME=graalvm-community-${JAVA_VERSION}_linux-x64_bin.tar.gz
ENV GRAAL_URL=https://github.com/graalvm/graalvm-ce-builds/releases/download/${JAVA_VERSION}/${GRAAL_FILENAME}
RUN echo $GRAAL_URL
RUN curl -4 -L $GRAAL_URL -o /tmp/${GRAAL_FILENAME}

RUN tar -zxvf /tmp/${GRAAL_FILENAME} -C /tmp && mv /tmp/${GRAAL_FILENAME} /usr/lib/graalvm
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