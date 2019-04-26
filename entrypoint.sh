#!/usr/bin/env bash

if [[ "${FRP_MODE}" != "s" ]];then
./frps -c /data/frps.ini
else
./frpc -c /data/frpc.ini
fi