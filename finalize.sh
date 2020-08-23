#!/bin/bash
set -e
source /pd_build/buildconfig

header "Finalizing..."

run apt-get remove -y autoconf automake \
&& apt-get autoremove \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
&& rm -rf /pd_build
