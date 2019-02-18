#!/bin/bash
set -e
source /pd_build/buildconfig

## Many NPM packages contain native extensions and require a compiler.
run minimal_apt_get_install build-essential libpq-dev libxrender1 fontconfig xvfb sudo poppler-utils geoip-database-contrib
run minimal_apt_get_install postgresql-client-10 nodejs 
run npm install -g less less-plugin-clean-css
run npm cache clear
curl -Lf -o /tmp/wkhtmltox_0.12.5-1.bionic_amd64.deb https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
run cd /opt/
run minimal_apt_get_install /tmp/wkhtmltox_0.12.5-1.bionic_amd64.deb 
run sudo ln -s /usr/local/bin/wkhtmltopdf /usr/bin/wkhtmltopdf
run sudo ln -s /usr/local/bin/wkhtmltoimage /usr/bin/wkhtmltoimage
