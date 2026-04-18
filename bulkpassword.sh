#!/bin/sh

password=$(openssl rand -base64 16)
cat user.txt | xargs -n 1 usermod -p "$password"
