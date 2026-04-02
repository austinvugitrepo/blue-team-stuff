#!/bin/sh

choice="idk" #choice filled with random string

while [ "$choice" != "q" ]
 do
	echo 'How do you want to list all services?:'
	echo 'A. active services'
	echo 'B. inactive services'
	echo 'S. search service'
        echo 'Your choice:';read choice
	if [ "$choice" = "q" ]; then   # press q to quit
                echo 'Bye!'
                exit 0
        fi

	if [ "$choice" = "s" ] || [ "$choice" = "S" ]; then
		echo 'Enter search keyword:'
		read searchkeyword
		systemctl list-units --all --type=service | grep $searchkeyword
		
	elif [ "$choice" = "a" ] || [ "$choice" = "A" ]; then
		systemctl list-units --all --type=service | grep -w 'active' #grep -w means search exactly for active and not include in(active) too

	elif [ "$choice" = "b" ] || [ "$choice" = "B" ]; then
		systemctl list-units --all --type=service | grep -w 'inactive'
	else
		echo 'Wrong selection. Try again.'
	fi
 done
