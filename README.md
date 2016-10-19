# spawn-web-request
A suite of shell scripts to spwan web requests to get something online which everone dogfights for.

You need to have paralle and [mitmproxy](https://github.com/mitmproxy/mitmproxy) installed.<br>
Also you need to know [how to use](http://docs.mitmproxy.org/en/stable/tutorials/30second.html) mitmproxy to record.<br>
Once you save the flow which you want to replay, type

`./parallel_run.sh "./replay.sh <saved flow to replay>" <number of instances>`
