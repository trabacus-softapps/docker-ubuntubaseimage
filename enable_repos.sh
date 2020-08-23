#!/bin/bash
set -e
source /pd_build/buildconfig

header "Preparing APT repositories"

## PostgreSQL Latest
run apt-get update \
&& apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8 \
&& echo "+ Enabled PostgreSQL APT repo" \
&& "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" > /etc/apt/sources.list.d/pgdg.list \

## Nginx Latest
##run apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62 
##echo "+ Enabled Nginx APT repo"
##echo "deb http://nginx.org/packages/ubuntu/ bionic nginx" > /etc/apt/sources.list.d/nginx.list

## Nodejs Latest
&& curl -sL https://deb.nodesource.com/setup_12.x | bash - \
&& apt-get update \
&& apt-get upgrade -y -o Dpkg::Options::="--force-confold"
