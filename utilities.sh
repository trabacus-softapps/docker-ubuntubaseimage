#!/bin/bash
set -e
source /pd_build/buildconfig

## Many NPM packages contain native extensions and require a compiler.
run minimal_apt_get_install build-essential libpq-dev libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg-dev libfreetype6-dev zlib1g-dev libldap2-dev libsasl2-dev libxrender1 fontconfig xvfb sudo poppler-utils 
run minimal_apt_get_install postgresql-client-9.6 nodejs
run set -x && npm install -g less less-plugin-clean-css rtlcss
curl -Lf -o /tmp/wkhtmltox_0.12.5-1.xenial_amd64.deb https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.xenial_amd64.deb
run cd /opt/
run minimal_apt_get_install /tmp/wkhtmltox_0.12.5-1.xenial_amd64.deb 
run sudo ln -s /opt/wkhtmltox/bin/wkhtmltopdf /usr/bin/wkhtmltopdf
run sudo ln -s /opt/wkhtmltox/bin/wkhtmltoimage /usr/bin/wkhtmltoimage
