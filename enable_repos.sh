#!/bin/bash
set -e
source /pd_build/buildconfig

header "Preparing APT repositories"

## PostgreSQL Latest
run apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
echo "+ Enabled PostgreSQL APT repo"
echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" > /etc/apt/sources.list.d/pgdg.list

## Nginx Latest
##run apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62 
##echo "+ Enabled Nginx APT repo"
##echo "deb http://nginx.org/packages/ubuntu/ xenial nginx" > /etc/apt/sources.list.d/nginx.list

## Nodejs Latest
#curl -sL https://deb.nodesource.com/setup_10.x | bash -

run apt-get update
run apt-get upgrade -y -o Dpkg::Options::="--force-confold"
