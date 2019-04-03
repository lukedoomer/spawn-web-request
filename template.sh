#!/bin/bash

base=/path/spawn-web-request
request=$base/path/request.sh
instance=2
delay=0
regex=keyword\|:code

function fight() {
	cmd="${base}/parallel_run.sh -n ${instance} -e "\'"${base}/replay.sh -f ${request} -d ${delay}"
	if [ ! -z "$regex" ]; then
		cmd="${cmd} -c ${regex}"
	fi
	eval "$cmd"\'
}

fight
