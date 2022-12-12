#!/bin/sh -l


set -x

INPUT_JOB_STATUS='success'

# curl request for the slack webhook webhook: curl POST, headers, data (slack json obj), slack webhook
if [ "${INPUT_JOB_STATUS}" = 'success' ]
then
  export INPUT_SLACK_STATUS_EMOJI=':white_check_mark::white_check_mark::white_check_mark:'
  export INPUT_DISPLAY_IMAGE_URL='https://www.gifcen.com/wp-content/uploads/2022/02/congratulations-gif-8.gif'

elif [ "${INPUT_JOB_STATUS}" = 'failure' ]
then
  export INPUT_SLACK_STATUS_EMOJI=':rotating_light::rotating_light::rotating_light:'
  export INPUT_DISPLAY_IMAGE_URL='https://c.tenor.com/-kZOB16tELEAAAAC/this-is-fine-fire.gif'

fi # else cancelled

export INPUT_DISPLAY_IMAGE_URL='https://www.gifcen.com/wp-content/uploads/2022/02/congratulations-gif-8.gif'
envsubst < /message.html > /newMessage.html

sendemail -f "bhati.shristy@gmail.com" \
          -t "srishty.bhati.rathore@gmail.com" \
          -s "smtp.gmail.com:587" \
          -v -v \
          -o tls=yes \
          -u "test" \
          -xu "bhati.shristy@gmail.com" \
          -xp "ilnhkebrjbfuawkh" \
          -o message-content-type=other \
          -o message-file=/newMessage.html

sleep 120