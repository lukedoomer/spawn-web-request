#!/bin/bash

request=/path/*.curl

# give seq N if want to run every request N times in parallel in a single round
repeat=`seq 10 | xargs -I -- ls -d $request`

parallel 'echo {1/.}; date "+%Y/%m/%d %T.%3N"; sh {1}' ::: `ls -d $repeat` ::: {1..10}
