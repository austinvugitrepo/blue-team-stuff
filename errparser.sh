#!/bin/sh

find /var/log -type f | sed -e '/.journal/d' | xargs grep --color -e "fail" -e "error" -e "login"
