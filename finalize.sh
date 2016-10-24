#!/bin/bash
set -e
source /pd_build/buildconfig

header "Finalizing..."

run apt-get remove -y autoconf automake
run apt-get autoremove
run apt-get clean
run rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
if [[ "$final" = 1 ]]; then
	run rm -rf /pd_build
else
	run rm -f /pd_build/{install,enable_repos,prepare,finalize}.sh
	run rm -f /pd_build/{Dockerfile,insecure_key*}
fi
