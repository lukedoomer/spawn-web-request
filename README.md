# spawn-web-request
A suite of shell scripts to spwan web requests to get something online which everone dogfights for.

You need to have paralle and [mitmproxy](https://github.com/mitmproxy/mitmproxy) installed.<br>
Also you need to know [how to use](http://docs.mitmproxy.org/en/stable/tutorials/30second.html) mitmproxy to record.<br>
Once you save the flow which you want to replay, type

`./parallel_run.sh -n <number of instances> -e './replay.sh -f <saved flow to replay> -d <delay up to random seconds> -c \"<condition to stop>\"'`
