#!/bin/bash
set -e
source /pd_build/buildconfig

header "Installing Python..."

## Install Python libs.
run pip install --upgrade --no-index --pre \
        --find-links=/pd_build/lib  --requirement=/pd_build/requirements.txt \
