#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title post_to_my_timeline
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Placeholder" }

# Documentation:
# @raycast.author yukimura1227
# @raycast.authorURL https://raycast.com/yukimura1227

echo "Hello World! Argument1 value: "$1""

source .secret_post_to_my_timeline
CHANNEL=%23times_takamura
TEXT=$1
USERNAME=hiroyuki.takamura
curl -XPOST -d "token=${TOKEN}" -d "channel=${CHANNEL}" -d "text=${TEXT}" -d "username=${USERNAME}" "https://slack.com/api/chat.postMessage"
