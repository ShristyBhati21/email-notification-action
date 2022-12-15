#!/bin/sh -l


set -x

# curl request for the slack webhook webhook: curl POST, headers, data (slack json obj), slack webhook
if [ "${INPUT_JOB_STATUS}" = 'success' ]
then
  export INPUT_DISPLAY_IMAGE_URL='https://media.giphy.com/media/ekwEeLxb7G4DW44YaK/giphy.gif'

elif [ "${INPUT_JOB_STATUS}" = 'failure' ]
then
  export INPUT_DISPLAY_IMAGE_URL='https://media.giphy.com/media/xUNd9TXtXVONOxbQ1W/giphy.gif'

fi # else cancelled

export TAG_VERSION=$(git describe --tag --abbrev=0)

envsubst < /message_template.html > /message.html

sendemail -f ${INPUT_FROM_EMAIL} \
          -t ${INPUT_TO_EMAIL} \
          -s "smtp.gmail.com:587" \
          -v -v \
          -o tls=yes \
          -u ${INPUT_JOB_STATUS} : ${INPUT_SUBJECT} \
          -xu ${INPUT_AUTHORISED_USERNAME} \
          -xp ${INPUT_AUTHORISED_PASSWORD} \
          -o message-content-type=html \
          -o message-file=/message.html