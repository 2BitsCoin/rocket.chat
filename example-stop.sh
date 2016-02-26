#!/bin/sh
PORT=3000
PID=`lsof -i4 | grep $PORT | grep node | awk '{print $2}'`
kill $PID
