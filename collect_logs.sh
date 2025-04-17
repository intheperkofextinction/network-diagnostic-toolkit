#!/bin/bash

echo "Collecting system logs...."

# save dmesg logs
dmesg | tail -n 50 > system_dmesg.log

# save syslog (on Ubuntu)
sudo tail -n 50 /var/log/syslog >system_syslog.log

# combine logs
cat system_dmesg.log system_syslog.log > system_logs.txt
echo "Logs saved to system_logs.txt"
