#!/bin/bash
set -e
source /pd_build/buildconfig

header "Installing Python..."

## Install Python.
run apt-get install -y python python-dev python-pip
run pip install --upgrade --no-index --pre \
        --find-links=/pd_build/lib  --requirement=/pd_build/requirements.txt

## fixed “libGeoIP.so.1: cannot open shared object No such file or directory” error
run apt-get install -y python-geoip
