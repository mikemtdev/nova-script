#! /usr/bin/bash

sudo bash -c 'echo 46 > /proc/sys/net/ipv4/ip_default_ttl'
echo "Changed to 46"
