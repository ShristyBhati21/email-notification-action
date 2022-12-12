# Container image that runs your code
FROM ubuntu:latest

RUN apt-get update \
    && apt-get install libio-socket-ssl-perl -y \
    && apt-get install libnet-ssleay-perl -y \
    && apt-get install sendemail -y \
    && apt-get install ca-certificates -y \
    && apt-get install -y gettext-base

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY files/message_template.html /message_template.html
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]