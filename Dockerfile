# Container image that runs your code
FROM ubuntu:latest

RUN apt-get update
RUN apt-get install libio-socket-ssl-perl -y
RUN apt-get install libnet-ssleay-perl -y
RUN apt-get install sendemail -y
RUN apt-get install ca-certificates -y

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY files/message.json /message.json
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]