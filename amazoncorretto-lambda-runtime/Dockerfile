# install base linux + tools
ARG AMAZON_CORRETTO_IMAGE=amazoncorretto:21.0.0
FROM $AMAZON_CORRETTO_IMAGE
RUN yum -y install zip

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
