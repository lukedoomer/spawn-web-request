#!/bin/bash
flag=false

usage()
{
	echo "$0 -f <curl script to replay> [-d <delay up to random seconds>] [-c <condition to stop>]"
	exit 1	
}

while getopts "f:c:d:" opt; do
	case $opt in
	f)
		flag=true
		curl=$OPTARG
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
result=`sh $curl`
# ouput the completed time
datetime=`date '+%Y/%m/%d %H:%M:%S'`
printf "$datetime\t$result\n"
if [ -z "$condition" ]; then
	exit 1
elif [[ $result =~ $condition ]]; then
	exit 0
else
	exit 1
fi
