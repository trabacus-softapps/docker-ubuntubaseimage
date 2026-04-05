#!/bin/bash
set -e
source /pd_build/buildconfig

header "Performing miscellaneous preparation"

## Ensure that docs and non-English locales are not installed.
run cp /pd_build/config/dpkg-nodocs.conf /etc/dpkg/dpkg.cfg.d/01_nodoc && cp /pd_build/config/dpkg-only-english-locale.conf /etc/dpkg/dpkg.cfg.d/01_only_english_locale \
&& adduser --home=/opt/odoo --disabled-password --gecos "Odoo Application" --shell=/bin/bash odoo
## Create a user for odoo. (Line 9)
