#!/bin/sh
echo 'How do you want to list all services?:'
echo 'A. active services'
echo 'B. inactive services'
read choice

if [ -z "$choice" ]; then
	echo 'Bye!'
fi

if [ "$choice" = "a" ] || [ "$choice" = "A" ]; then
	systemctl list-units --all --type=service | grep -w 'active' #grep -w means search exactly for active and not include in(active) too

elif [ "$choice" = "b" ] || [ "$choice" = "B" ]; then
	systemctl list-units --all --type=service | grep -w 'inactive'
else
	echo 'Try again.'
fi
