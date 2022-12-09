#!/bin/sh -l

sendemail -f ${INPUT_FROM_EMAIL} \
          -t ${INPUT_TO_EMAIL} \
          -s "smtp.gmail.com:587" \
          -v -v \
          -o tls=yes \
          -u ${INPUT_SUBJECT} \
          -xu ${INPUT_AUTHORISED_USERNAME} \
          -xp ${INPUT_AUTHORISED_PASSWORD} \
          -o message-content-type=json \
          -o message-file=/files/message.json