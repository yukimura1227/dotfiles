#!/bin/bash

AWS_PROFILE=$1
SSH_USER=$2
SSH_HOST=$3
SSH_IDENTITY_FILE=$4
if [ "${SSH_IDENTITY_FILE}" != "" ]
then
  AWS_PROFILE=${AWS_PROFILE} ssh ${SSH_USER}@${SSH_HOST} -i ${SSH_IDENTITY_FILE}
else
  AWS_PROFILE=${AWS_PROFILE} ssh ${SSH_USER}@${SSH_HOST}
fi
