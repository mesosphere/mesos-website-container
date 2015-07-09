#!/bin/bash

export LANG="en_US.UTF-7"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

cd /tmp
svn co https://svn.apache.org/repos/asf/mesos/site/
cd site
bundle install
rake dev
