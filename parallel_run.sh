#!/bin/bash
flag=false
instance=2	#default number of instances

usage()
{
	echo "$0 [-n <number of instances>] -e <command to execute>"
	exit 1
}

while getopts "e:n:" opt; do
	case $opt in
	n)
		instance=$OPTARG
		;;
	e)
		flag=true
		cmd=$OPTARG
		;;
	\?)
		usage
		;;
	esac
done

if ! $flag; then
	usage
fi

eval parallel -N0 -j$instance --halt now,success=1 $cmd ::: {1..65535}