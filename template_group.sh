#!/bin/bash

request=/path/*.curl

# give multiple request variables if want to run every request multiple times in parallel in a single round
parallel 'echo {1/.}; date "+%Y/%m/%d %T.%3N"; sh {1}' ::: `ls -d $request $request` ::: {1..10}
