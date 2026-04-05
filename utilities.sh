#!/bin/bash
set -e
source /pd_build/buildconfig


## Many NPM packages contain native extensions and require a compiler.
run minimal_apt_get_install sudo ca-certificates dirmngr fonts-noto-cjk xz-utils xz-utils libssl-dev libxml2-dev libxslt1-dev libjpeg-dev libfreetype6-dev zlib1g-dev libldap2-dev libsasl2-dev build-essential postgresql-client \
&& curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - \
&& apt-get install nodejs -y \
&& set -x && npm install -g less@2.7.1 less-plugin-clean-css@1.5.1  rtlcss@3.5.0 \
&& curl -Lf -o /tmp/wkhtmltox_bullseye_amd64.deb  https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.bullseye_amd64.deb \
&& cd /opt/ \
&& minimal_apt_get_install /tmp/wkhtmltox_bullseye_amd64.deb
run sudo ln -s /usr/local/bin/wkhtmltopdf /usr/bin/wkhtmltopdf 
run sudo ln -s /usr/local/bin/wkhtmltoimage /usr/bin/wkhtmltoimage

# Download Maxmind db version 2
# This example uses the free version from https://dev.maxmind.com/geoip/geoip2/geolite2/
#
# We only use the city db, you can add the country db and others if you want them.
run mkdir -p /usr/share/geoip \
&& mkdir -p /usr/share/GeoIP \
&& curl -Lf -o /tmp/GeoLite2-City.mmdb.gz https://cdn.jsdelivr.net/npm/geolite2-city/GeoLite2-City.mmdb.gz \
&& gunzip /tmp/GeoLite2-City.mmdb.gz \
&& cp /tmp/GeoLite2-City.mmdb /usr/share/geoip \
&& cp /tmp/GeoLite2-City.mmdb /usr/share/GeoIP \
&& ls -al /usr/share/geoip/
