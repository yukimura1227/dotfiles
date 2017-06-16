#!/bin/bash

BASE_DIR=`dirname ${0}`

setup_targets=(imgls imgcat)
for target in ${setup_targets[@]}
do
  destinate_path=/usr/local/bin/${target}
  cp -p ${BASE_DIR}/${target} ${destinate_path}
  chmod +x ${destinate_path}
done
