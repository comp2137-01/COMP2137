#!/bin/bash

# This is a script to update the operating system software
# It shouldn't ask the user any questions other than sudo password
# It will use commands like sudo, apt

# Update the local list of available software
sudo apt update

# Upgrade any out of date packages
sudo apt-get -qq upgrade

