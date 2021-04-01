#!/bin/bash
set -e
source /pd_build/buildconfig

header "Installing Python..."

## Install Python.
run apt-get install -y python3 python3-dev \
&& curl https://bootstrap.pypa.io/get-pip.py | python3 \
&& pip install --upgrade --no-index --pre \
        --find-links=/pd_build/lib  --requirement=/pd_build/requirements.txt \
