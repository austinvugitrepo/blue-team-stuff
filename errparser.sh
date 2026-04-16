#!/bin/sh

find /var/log -type f | sed -e '/.journal/d' | xargs grep --color -e "password" -e "error" -e "login" -e "user" -e "failed" -e "invalid"
