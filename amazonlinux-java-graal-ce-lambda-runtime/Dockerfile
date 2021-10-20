# install base linux + tools
ARG AWS_LINUX_VERSION=2.0.20211001.0
FROM amazonlinux:$AWS_LINUX_VERSION

RUN yum install -y gcc gcc-c++ libc6-dev binutils zlib1g-dev curl bash zlib zlib-devel tar zip gzip

# get graal...
ARG GRAAL_VERSION=21.3.0
ARG JAVA_VERSION=java11
ENV GRAAL_FILENAME=graalvm-ce-${JAVA_VERSION}-linux-amd64-${GRAAL_VERSION}.tar.gz
ENV LANG=en_US.UTF-8
RUN curl -4 -L https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAAL_VERSION}/${GRAAL_FILENAME} -o /tmp/${GRAAL_FILENAME}

RUN tar -zxvf /tmp/${GRAAL_FILENAME} -C /tmp && mv /tmp/graalvm-ce-${JAVA_VERSION}-${GRAAL_VERSION} /usr/lib/graalvm
RUN rm -rf /tmp/*

# ...and install it...
RUN /usr/lib/graalvm/bin/gu install native-image

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