#!/bin/sh -l


set -x

echo "JOB_STATUS: ${INPUT_JOB_STATUS}"

# curl request for the slack webhook webhook: curl POST, headers, data (slack json obj), slack webhook
if [[ "${INPUT_JOB_STATUS}" == 'success' ]]; then
  export INPUT_SLACK_STATUS_EMOJI=':white_check_mark::white_check_mark::white_check_mark:'
  export INPUT_DISPLAY_IMAGE_URL='https://www.gifcen.com/wp-content/uploads/2022/02/congratulations-gif-8.gif'

elif [[ "${INPUT_JOB_STATUS}" == 'failure' ]]; then
  export INPUT_SLACK_STATUS_EMOJI=':rotating_light::rotating_light::rotating_light:'
  export INPUT_DISPLAY_IMAGE_URL='https://c.tenor.com/-kZOB16tELEAAAAC/this-is-fine-fire.gif'

fi # else cancelled

message = ${curl -X POST -H 'Content-type: application/html' --data "$(envsubst < /message.html)"}

sendemail -f ${INPUT_FROM_EMAIL} \
          -t ${INPUT_TO_EMAIL} \
          -s "smtp.gmail.com:587" \
          -v -v \
          -o tls=yes \
          -u ${INPUT_SUBJECT} \
          -xu ${INPUT_AUTHORISED_USERNAME} \
          -xp ${INPUT_AUTHORISED_PASSWORD} \
          -m ${message}