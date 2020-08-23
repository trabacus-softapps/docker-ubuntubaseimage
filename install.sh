#!/bin/bash
set -e
source /pd_build/buildconfig

run /pd_build/enable_repos.sh \
&& /pd_build/prepare.sh \
&& /pd_build/utilities.sh \

&& /pd_build/python.sh \

#run /pd_build/nginx.sh

&& /pd_build/finalize.sh
