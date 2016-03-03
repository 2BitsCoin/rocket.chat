#!/bin/sh
PORT=3000
PID=`lsof -i4 | grep $PORT | grep node | awk '{print $2}')`
if [ -n "$PID" ]; then
	kill $PID
	echo "OK"
fi
