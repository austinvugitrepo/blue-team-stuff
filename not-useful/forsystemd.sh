#!/bin/sh

menu(){
        echo 'FORSYSTEMDv1.3'
        echo '~~~~~~~~~~~~~~'
        echo 'Hint: to pause this script, CRTL + Z then type fg to return to this script session. You can use this opportunity to run any commands or do whatever really that this script can not do'
        echo ''
        echo '------------------------------------------------------------------'
        echo 'Systemctl Tasks:'
        echo '------------------------------------------------------------------'
        echo '+ press a to see active services.'
        echo '+ press b to see inactive services.'
        echo '+ press s to search for a service.'
        echo ''
        echo '------------------------------------------------------------------'
        echo 'Journalctl Tasks:'
        echo '------------------------------------------------------------------'
        echo '+ press l to check log of a service.'
        echo ''
        echo '------------------------------------------------------------------'
        echo 'Other:'
        echo '------------------------------------------------------------------'
        echo '+ press c to clear terminal.'
        echo '+ press q to quit.'
	echo '+ type "list" to list menu.'
        echo ''
}
choice="idk" #choice filled with random string

menu
while [ "$choice" != "q" ]
 do     
        echo ''
        echo ''	
        echo 'Input:';read choice
	clear
	if [ "$choice" = "q" ]; then   # press q to quit
                exit 0
	elif [ "$choice" = "list" ]; then
		menu
        
	elif [ "$choice" = "l" ] || [ "$choice" = "L" ]; then
		
		echo 'WARNING: Please search service before checking log of service, the names need to be exact!!!'
		echo 'Enter the exact service name:'
		read logservice
		journalctl -x -e -u $logservice #u is for the unit service thing and x is for helpful explanations and e is to reach to the end aka recents of a service log
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
