#!/bin/bash
set -e
source /pd_build/buildconfig

run minimal_apt_get_install gnupg curl

header "Preparing APT repositories"

## PostgreSQL Latest
echo "+ Enabled PostgreSQL APT repo"

echo 'deb http://apt.postgresql.org/pub/repos/apt/ focal-pgdg main' > /etc/apt/sources.list.d/pgdg.list \
    && GNUPGHOME="$(mktemp -d)" \
    && export GNUPGHOME \
    && repokey='B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8' \
    && gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "${repokey}" \
    && gpg --batch --armor --export "${repokey}" > /etc/apt/trusted.gpg.d/pgdg.gpg.asc \
    && gpgconf --kill all \
    && rm -rf "$GNUPGHOME" 

## Nodejs Latest
curl -sL https://deb.nodesource.com/setup_14.x | bash - \
&& apt-get update \
&& apt-get upgrade -y -o Dpkg::Options::="--force-confold"
