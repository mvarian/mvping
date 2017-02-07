# mvping
A simple shell script to ping a host at a specified interval and record latency to a csv file, useful for generating baseline network health data for troubleshooting purposes.


## Features

* Designed to be deployed into a client environment and gather basic network data on connectivity to one or more specific hosts.  
* Will ping a host at the configured interval and extract the latency of the single ping.
* Data is appended to a log file in csv format with the host, timestamp, and latency in ms.  If the ping fails, a "*" will be inserted for the latency value.
* Script will make sure that only one instance is running at one time, if it is executed multiple times the subsequent executions will abort.
* For unattended execution, schedule the script to run every minute in cron.  The script will automatically begin on boot, and if it crashes it will resume within 60 seconds.
* To fetch log files remotely, consider scheduled mailx, mutt, or scp to a remote server.  Alternatively, set up a basic samba share and fetch from another machine on the network.


## Usage

1. In `mvping.sh`, configure HOST, LOGPATH, and INTERVAL.

2. Run `mvping.sh` in a terminal session, or schedule it to run in cron.

3. `mvping.sh` will continue to run until killed.  Output is written in csv format in LOGPATH and can be opened by any spreadsheet program.

To gather data on a second host simultaneously, make a copy of `mvping.sh`, change the HOST, LOGPATH, and PIDFILE variables so they are different, and run as normal.


## Supported Platforms

mvping has only been tested on CentOS 7 and macOS 10.12.  It should also work on any other Redhat-compatible Linux distribution.