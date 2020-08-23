#!/bin/bash
set -e
source /pd_build/buildconfig

header "Preparing APT repositories"

## PostgreSQL Latest
echo "+ Enabled PostgreSQL APT repo"
echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list

run apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 && \
curl -sL https://deb.nodesource.com/setup_12.x | bash - \
&& apt-get update \
&& apt-get upgrade -y -o Dpkg::Options::="--force-confold"

## Nodejs Latest (Line 12)
