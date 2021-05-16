#!/bin/bash
declare -i fmem
while [ true ]
do
        fmem=` awk '/MemFree/ { print $2 }' /proc/meminfo`
        if [ "$fmem" -lt "16000" ]
        then
                echo FREE MEMORY IS LOW----RESTARTING STRATUX
                sudo service stratux restart
                exit
        fi
        sleep 60
done
