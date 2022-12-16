#!/bin/sh -l

echo "SLACK_WEBHOOK: ${INPUT_SLACK_WEBHOOK}"
echo "JOB_STATUS: ${INPUT_JOB_STATUS}"

if [ "${INPUT_JOB_STATUS}" = 'success' ]
then
  export INPUT_DISPLAY_IMAGE_URL='https://media.giphy.com/media/ekwEeLxb7G4DW44YaK/giphy.gif'

elif [ "${INPUT_JOB_STATUS}" = 'failure' ]
then
  export INPUT_DISPLAY_IMAGE_URL='https://media.giphy.com/media/xUNd9TXtXVONOxbQ1W/giphy.gif'

fi # else cancelled

#Retrieving latest tag version
git config --global --add safe.directory '/github/workspace'
export TAG_VERSION=$(git describe --tag --abbrev=0)

curl -X POST -H 'Content-type: application/json' --data "$(envsubst < /message.json)" "${INPUT_SLACK_WEBHOOK}" "${INPUT_TAG_VERSION}"