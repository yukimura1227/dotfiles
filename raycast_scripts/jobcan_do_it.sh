#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title jobcan_do_it
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author yukimura1227
# @raycast.authorURL https://raycast.com/yukimura1227

PATH=${PATH}:/usr/local/bin
. ~/.bash_profile
echo "jobcan start"
jobcan start
