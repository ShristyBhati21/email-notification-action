# This Dockerfile creates an image used to run the Slack-Notifier

# cd to dir containing the Dockerfile
# docker build -f Dockerfile -t ghcr.io/byzgenltd/slack-notifier-action:0.0.1 .
# docker push ghcr.io/byzgenltd/slack-notifier-action:0.0.1

FROM ubuntu:latest

RUN apt-get install curl gettext \
     && apt-get update \
     && aapt-getpk install git

WORKDIR /
COPY files/message.json /message.json
COPY files/entrypoint.sh /entrypoint.sh

CMD chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh "${1}" "${2}"