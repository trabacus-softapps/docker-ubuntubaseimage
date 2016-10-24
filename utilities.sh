#!/bin/bash
set -e
source /pd_build/buildconfig

## Many NPM packages contain native extensions and require a compiler.
run minimal_apt_get_install build-essential libpq-dev 
run minimal_apt_get_install postgresql-client-9.6 wkhtmltopdf nodejs 
run npm install -g less less-plugin-clean-css
run npm cache clear
