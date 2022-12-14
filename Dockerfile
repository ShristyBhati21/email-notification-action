# This Dockerfile creates an image used to run the Slack-Notifier

# cd to dir containing the Dockerfile
# docker build -f Dockerfile -t ghcr.io/byzgenltd/slack-notifier-action:0.0.1 .
# docker push ghcr.io/byzgenltd/slack-notifier-action:0.0.1

FROM ubuntu:latest

RUN apt-get update \
     && apt-get install gettext -y \
     && apt-get install curl -y \
     && apt-get install git -y

WORKDIR /
COPY files/message.json /message.json
COPY files/entrypoint.sh /entrypoint.sh

CMD chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh "${1}" "${2}"