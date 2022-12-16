#!/bin/sh -l

echo "SLACK_WEBHOOK: ${INPUT_SLACK_WEBHOOK}"
echo "JOB_STATUS: ${INPUT_JOB_STATUS}"

# curl request for the slack webhook webhook: curl POST, headers, data (slack json obj), slack webhook
if [[ "${INPUT_JOB_STATUS}" == 'success' ]]; then
  export INPUT_SLACK_STATUS_EMOJI=':white_check_mark::white_check_mark::white_check_mark:'
  export INPUT_DISPLAY_IMAGE_URL='https://www.gifcen.com/wp-content/uploads/2022/02/congratulations-gif-8.gif'

elif [[ "${INPUT_JOB_STATUS}" == 'failure' ]]; then
  export INPUT_SLACK_STATUS_EMOJI=':rotating_light::rotating_light::rotating_light:'
  export INPUT_DISPLAY_IMAGE_URL='https://c.tenor.com/-kZOB16tELEAAAAC/this-is-fine-fire.gif'

fi # else cancelled

#Retrieve latest tag version
git config --global --add safe.directory '/github/workspace'
export TAG_VERSION=$(git describe --tag --abbrev=0)

curl -X POST -H 'Content-type: application/json' --data "$(envsubst < /message.json)" "${INPUT_SLACK_WEBHOOK}" "${INPUT_TAG_VERSION}"