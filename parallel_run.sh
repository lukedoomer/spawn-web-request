#!/bin/bash
if [ $# -ne 2 ]
	then
		echo "$0 <command> <number of instances>"
		exit 1
fi

eval parallel -N0 -j$2 $1 ::: {1..65535}
