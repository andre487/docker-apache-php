#!/usr/bin/env bash
set -e

source /etc/apache2/envvars
/usr/sbin/apache2 -D FOREGROUND
