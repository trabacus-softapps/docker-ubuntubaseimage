#!/bin/bash
set -e
source /pd_build/buildconfig

run minimal_apt_get_install gnupg curl

header "Preparing APT repositories"

## PostgreSQL Latest
run apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
echo "+ Enabled PostgreSQL APT repo"
echo "deb http://apt-archive.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list

run apt-get update
run apt-get upgrade -y -o Dpkg::Options::="--force-confold"
