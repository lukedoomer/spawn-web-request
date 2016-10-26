#!/bin/bash
flag=false

usage()
{
	echo "$0 -f <saved flow to replay> [-d <delay up to random seconds>] [-c <condition to stop>]"
	exit 1	
}

while getopts "f:c:d:" opt; do
	case $opt in
	f)
		flag=true
		flow=$OPTARG
		;;
	d)
		delay=$OPTARG
		;;
	c)
		condition=$OPTARG
		;;
	\?)
		usage
		;;
	esac
done

if ! $flag; then
	usage
fi

# delay random seconds to avoid peak load
if [ $delay ]; then
	sleep $[$RANDOM % $delay].$[$RANDOM % 10]
fi
result=`docker exec -i pentest mitmdump -n -c $flow --anticache`
# ouput the completed time
datetime=`date '+%Y/%m/%d %H:%M:%S'`
printf "$datetime\t$result\n"
if [ "$condition" ]; then
	if [[ $result =~ $condition ]]; then
		exit 0
	else
		exit 1
	fi
fi
