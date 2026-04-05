#!/bin/bash
set -e
source /pd_build/buildconfig

run minimal_apt_get_install gnupg curl gzip

header "Preparing APT repositories"

## PostgreSQL Latest
echo "+ Enabled PostgreSQL APT repo"
run install -d /usr/share/postgresql-common/pgdg
curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc

# Create the repository configuration file:
run . /etc/os-release
run sh -c "echo 'deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $VERSION_CODENAME-pgdg main' > /etc/apt/sources.list.d/pgdg.list"

# Update the package lists:
run apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"
