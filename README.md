# spawn-web-request
A suite of shell scripts to spwan web requests to get something online which everyone dogfights for.

You need to have paralle and curl installed.<br>
Also you need to know how to export curl command from mitmproxy or firebug.<br>
Once you save the curl script which you want to replay, type

`./parallel_run.sh -n <number of instances> -e './replay.sh -f <curl script to replay> -d <delay up to random seconds> -c \"<condition to stop>\"'`
