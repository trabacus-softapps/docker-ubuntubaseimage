#!/bin/bash
set -e
source /pd_build/buildconfig

## Many NPM packages contain native extensions and require a compiler.
run minimal_apt_get_install build-essential libpq-dev libxrender1 fontconfig xvfb sudo poppler-utils 
run minimal_apt_get_install postgresql-client-9.6 nodejs 
run npm install -g less less-plugin-clean-css
run npm cache clear
curl -Lf -o /tmp/wkhtmltox-0.12.4-amd64.tar.xz http://download.gna.org/wkhtmltopdf/0.12/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
run cd /opt/
run sudo tar xf /tmp/wkhtmltox-0.12.4-amd64.tar.xz 
run sudo ln -s /opt/wkhtmltox/bin/wkhtmltopdf /usr/bin/wkhtmltopdf
run sudo ln -s /opt/wkhtmltox/bin/wkhtmltoimage /usr/bin/wkhtmltoimage
