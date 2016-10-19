#!/bin/bash
if [ $# -ne 1 ]
        then
                echo "$0 <saved flow to replay>"
                exit 1
fi

# sleep random seconds to avoid peak load
sleep 0.$[$RANDOM % 1000]
docker exec -i pentest mitmdump -n -c $1 --anticache
# ouput the completed time
date '+%Y/%m/%d %H:%M:%S'
