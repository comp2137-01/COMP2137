#!/bin/bash

# a script to display the current cpu activity level, free memory, and free disk space

# find and display the current cpu activity level
uptime |sed -e 's/^.*load/load/' 

# find and display the amount of free memory
echo -n "Free Memory: "
free -h | awk '/Mem:/{print $4}'

# find and display the amount of free disk space for any disk-based filesystems
# where the name for the disk in df output starts with /dev
df -h |awk '/^.dev/{print $1, ": ", $4}'

