FROM amazoncorretto:11

RUN yum -y install zip

# add lambda runtime bootstrap script
COPY bootstrap .
RUN chmod 777 bootstrap

# add script to create native executable and zip it
COPY packageZip .
RUN chmod 777 packageZip
