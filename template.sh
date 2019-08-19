#!/bin/bash

base=/path/spawn-web-request
request=/path/request.curl
instance=2
delay=1
regex=keyword\|:code

function fight() {
	cmd="${base}/parallel_run.sh -n ${instance} -e "\'"${base}/replay.sh -f ${request}"
	if [ ! -z "$delay" ]; then
		cmd="${cmd} -d ${delay}"
	fi
	if [ ! -z "$regex" ]; then
		cmd="${cmd} -c ${regex}"
	fi
	eval "$cmd"\'
}

fight
