#!/bin/bash
set -e
source /pd_build/buildconfig

## Many NPM packages contain native extensions and require a compiler.
run minimal_apt_get_install sudo poppler-utils
run minimal_apt_get_install postgresql-client-9.6 nodejs
#run sudo ln -s /usr/bin/nodejs /usr/bin/node
run minimal_apt_get_install npm
run set -x && npm install -g less@2.7.1 less-plugin-clean-css@1.5.1
curl -Lf -o /tmp/wkhtmltox_0.12.5-1.bionic_amd64.deb https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
run cd /opt/
run minimal_apt_get_install /tmp/wkhtmltox_0.12.5-1.bionic_amd64.deb 
run sudo ln -s /opt/wkhtmltox/bin/wkhtmltopdf /usr/bin/wkhtmltopdf
run sudo ln -s /opt/wkhtmltox/bin/wkhtmltoimage /usr/bin/wkhtmltoimage
