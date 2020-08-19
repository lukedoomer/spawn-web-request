#!/bin/bash

systemd-run --user --timer-property=AccuracySec=1us --on-calendar="2020-06-18 13:59:58.75" $HOME/tool/linux/spawn-web-request/project/script.sh
