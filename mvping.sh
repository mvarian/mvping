#!/usr/bin/env bash

# mvping.sh
# https://github.com/mvarian/mvping
# MIT License

# Configure HOST for your situation
HOST="127.0.0.1"

# Set destination log file
LOGPATH="$HOST-mv_pings.log.csv"

# Set ping interval in seconds
INVERVAL=1

#================ Code below is not meant to be modified ================#

PIDFILE="mvping.sh.pid"

if [ -f $PIDFILE ] 
then
	echo "[$(date)] : mvping.sh : Script is already running"
	exit 1
fi

# Ensure PID file is removed on program exit.
trap "rm -f -- '$PIDFILE'" EXIT

# Create a file with current PID to indicate that process is running.
echo $$ > "$PIDFILE"


# If log file does not yet exist, initialize it with column headers
if [ ! -f $LOGPATH ] 
then
	echo '"Hostname","Timestamp","Latency"' > $LOGPATH
fi

# Regex for extracting the numerical value of the ping latency
REGEX="(^[0-9]+.[0-9]+)"

# Infinite loop to record the latency of a ping every INTERVAL until script is aborted
while [ true ] 
do
	LATENCY=`(awk -F'=' '/^64/ {print $4}' <(ping -c1 $HOST)) | egrep -o $REGEX`
	NOW=`date +'%F %H:%M:%S'`
	echo "\"$HOST\",\"$NOW\",\"$LATENCY\"" >> "$LOGPATH"
	sleep "$INVERVAL"
done
