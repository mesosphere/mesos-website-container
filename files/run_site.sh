#!/bin/bash

export LANG="C.UTF-8"
export LANGUAGE="C.UTF-8"
export LC_ALL="C.UTF-8"

if [ -z $1 ]; then
  echo "Pulling website source from svn"
  cd /tmp
  svn co https://svn.apache.org/repos/asf/mesos/site/
  cd site
else
  echo "Using local website source: $1"
  cd $1
fi

bundle install && rake && rake dev
