#!/bin/bash
set -e
source /pd_build/buildconfig

## Many NPM packages contain native extensions and require a compiler.
run minimal_apt_get_install build-essential libpq-dev libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg-dev libfreetype6-dev zlib1g-dev libldap2-dev libsasl2-dev libxrender1 fontconfig xvfb sudo poppler-utils \
&& minimal_apt_get_install postgresql-client-10 nodejs \
&& set -x && npm install -g less less-plugin-clean-css rtlcss \
&& curl -Lf -o /tmp/wkhtmltox_0.12.6-1.bionic_amd64.deb https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.bionic_amd64.deb \
&& cd /opt/ \
&& minimal_apt_get_install /tmp/wkhtmltox_0.12.6-1.bionic_amd64.deb \
&& sudo ln -s /usr/local/bin/wkhtmltopdf /usr/bin/wkhtmltopdf \
&& sudo ln -s /usr/local/bin/wkhtmltoimage /usr/bin/wkhtmltoimage \

# Download Maxmind db version 2
# This example uses the free version from https://dev.maxmind.com/geoip/geoip2/geolite2/
#
# We only use the city db, you can add the country db and others if you want them.
&& mkdir -p /usr/share/geoip \
&& mkdir -p /usr/share/GeoIP \
&& curl -Lf -o /tmp/city.tar.gz https://www.trabacus.com/geolite2/GeoLite2-City_20200107.tar.gz \
&& tar xf /tmp/city.tar.gz -C /usr/share/geoip --strip 1 \
&& tar xf /tmp/city.tar.gz -C /usr/share/GeoIP --strip 1 \
&& ls -al /usr/share/geoip/
