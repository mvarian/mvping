# mvping
A simple shell script to ping a host every second and record latency to a csv file, useful for generating baseline network health data for troubleshooting purposes.


## Usage

# In `mvping.sh`, configure HOST, LOGPATH, and INTERVAL.

# Run mvping.sh in a terminal session, or schedule it to run in cron.

# mvping.sh will continue to run until killed.  Output is written in csv format in LOGPATH and can be opened by any spreadsheet program.


## Supported Platforms

mvping has only been tested on CentOS 7 and macOS 10.12.  It should also work on any other Redhat-compatible Linux distribution.