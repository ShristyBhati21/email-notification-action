#!/bin/sh -l

sendemail -f ${INPUT_FROM_EMAIL} \
          -t ${INPUT_TO_EMAIL} \
          -s "smtp.gmail.com:587" \
          -v -v \
          -o tls=yes \
          -u ${INPUT_SUBJECT} \
          -xu ${INPUT_AUTHORISED_USERNAME} \
          -xp ${{ env.PASSWORD }} \
          -o message-content-type=html \
          -o message-file=/message.html