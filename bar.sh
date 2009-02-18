#!/bin/sh
ql_play_main(){
        once=0
        for i in artist title 
                do 
                echo -n $(cat .quodlibet/current | grep $i | cut -d '=' -f2 )
                if [ $once -lt 1 ]
                        then
                        echo -n " - "
                        once=$(($once + 1))
                fi
                done
}
ql_play(){
        if [ -f .quodlibet/current ]
                then
                ql_play_main
        else
                echo -n ""
        fi
}
acpi(){
        yacpi -pbc
}
ram(){
        free -m | grep "^-/+" | awk '{print $3"/"$4}'
}
uptime(){
        /usr/bin/uptime | sed 's/.*://; s/,//g'
}
date(){
        /bin/date +%X
}
status() {
        echo -n $(ql_play) $(acpi) '| RAM:' $(ram) '|' $(uptime) '|' $(date)
}

if [ "$1" == "loop" ]
        then
        while true
                do
                status
                sleep "$2"
                done
else
        status
fi

