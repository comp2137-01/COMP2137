#!/bin/bash

# This is a script to display the current hostname, IP address, and gateway IP

# Find and display the current hostname with a label
echo -n "Hostname: "
hostname

# Find and display the IP address used to reach the internet from our pc with a label
echo -n "IP Address: "
ip r s default | awk '{print $9}'

# Find and display gateway IP with a label
echo -n "Gateway IP: "
ip r s default | awk '{print $3}'

