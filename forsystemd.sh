#!/bin/sh

choice="idk" #choice filled with random string

while [ "$choice" != "q" ]
 do     
	echo 'FORSYSTEMDv1.2'
	echo '------------------------------------------------------------------'
	echo 'Systemctl Tasks:'
	echo '------------------------------------------------------------------'
	echo 'A. active services'
	echo 'B. inactive services'
	echo 'S. search service'
	echo ''
	echo '------------------------------------------------------------------'
        echo 'Journalctl Tasks:'        
	echo '------------------------------------------------------------------'
        echo 'L. check log of a service'
	echo ''
	echo '------------------------------------------------------------------'
	echo 'Other:'
	echo '------------------------------------------------------------------'
	echo 'C. clear terminal'
	echo 'q. press q to quit'
	echo '' 
        echo 'Your choice:';read choice
	if [ "$choice" = "q" ]; then   # press q to quit
                echo 'Bye!'
                exit 0
        fi
        
	if [ "$choice" = "l" ] || [ "$choice" = "L" ]; then
		echo 'WARNING: Please search service before checking log of service, the names need to be exact!!!'
		echo 'Enter the exact service name:'
		read logservice
		journalctl -u $logservice
	elif [ "$choice" = "c" ] || [ "$choice" = "C" ]; then
		clear
	elif [ "$choice" = "s" ] || [ "$choice" = "S" ]; then
		echo 'Enter search keyword:'
		read searchkeyword
		systemctl list-units --all --type=service | grep $searchkeyword | awk 'BEGIN{print "| SERVICE | LOAD | ACTIVE | STATE | DESC |"}{print $0}' #put value here
		
	elif [ "$choice" = "a" ] || [ "$choice" = "A" ]; then
		systemctl list-units --all --type=service | grep -w 'active' | awk 'BEGIN{print "| SERVICE | LOAD | ACTIVE | STATE | DESC |"}{print $0}' #grep -w means search exactly for active and not include in(active) too
                
	elif [ "$choice" = "b" ] || [ "$choice" = "B" ]; then
		systemctl list-units --all --type=service | grep -w 'inactive' | awk 'BEGIN{print "| SERVICE | LOAD | ACTIVE | STATE | DESC |"}{print $0}'
		
	else
		echo 'Wrong selection. Try again.'
		
	fi
 done
