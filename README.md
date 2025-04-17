# Network Diagnostic Toolkit Report

## Introduction
This toolkit contains a set of Bash scripts designed to perform basic network diagnostics and collect system logs for troubleshooting. The scripts include:

Ping Test: To check connectivity to a specific host.

Traceroute Test: To trace the route packets take to reach a destination.

System Log Collection: To gather system logs for diagnostic purposes.

Purpose of the Toolkit
The purpose of this toolkit is to provide a set of simple scripts that can be used to troubleshoot network issues by:

Testing the reachability of remote systems using ping.

Analyzing the network path to a destination using traceroute.

Collecting system logs to analyze potential system-level issues.

Script Overview
1. Ping Test (ping_test.sh)
Description:
The ping_test.sh script performs a basic ping operation to check the connectivity to a specific host.

How it works:

The script prompts the user to input a hostname or IP address.

It then uses the ping command to send 4 ICMP packets to the specified host.

The results (including round-trip times and packet loss) are displayed.

Code Overview:


#!/bin/bash
echo "Enter the host to ping:"
read host
echo "Pinging $host..."
ping -c 4 $host
Usage:

When running the script, you will be prompted to enter the host.

The script will output the time it takes to send and receive packets, helping to determine network performance.

Example Output:


PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=52 time=88.5 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=52 time=59.2 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=52 time=29.6 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=52 time=27.3 ms

2. Traceroute Test (traceroute_test.sh)

Description:
The traceroute_test.sh script performs a traceroute operation to trace the route packets take to reach the destination host.

How it works:

The user is prompted to enter the destination (hostname or IP).

The script uses the traceroute command to identify each hop between the local machine and the destination, displaying the time taken for each hop.

Code Overview:


#!/bin/bash
echo "Enter the host for traceroute:"
read host
echo "Tracing route to $host"
traceroute $host

Usage:

When running the script, enter the destination (e.g., google.com).

The script will display each hop in the path with round-trip times, helping to identify delays and routing issues.

Example Output:


traceroute to google.com (142.250.195.142), 30 hops max, 60 byte packets
 1  LAPTOP-V4P855CU.mshome.net (172.26.208.1)  0.312 ms
 2  jiofiber.local.html (192.168.31.1)  82.622 ms
 3  192.0.0.1 (192.0.0.1)  74.350 ms
 ...

3. System Log Collection (collect_logs.sh)

Description:
The collect_logs.sh script collects essential system logs for troubleshooting.

How it works:

The script gathers the most recent entries from the dmesg and syslog logs.

It then combines these logs into a single file (system_logs.txt) for easier review.

Code Overview:


#!/bin/bash
echo "Collecting system logs..."

# Save dmesg logs
dmesg | tail -n 50 > system_dmesg.log

# Save syslog (on Ubuntu)
sudo tail -n 50 /var/log/syslog > system_syslog.log

# Combine logs
cat system_dmesg.log system_syslog.log > system_logs.txt
echo "Logs saved to system_logs.txt"
Usage:

When executed, the script collects the most recent 50 entries from the dmesg and /var/log/syslog files.

It then combines these logs into a single file (system_logs.txt), which can be reviewed for potential system issues.

Example Output:

bash
Copy
Edit
Collecting system logs...
Logs saved to system_logs.txt

Conclusion
The network diagnostic toolkit is a simple but powerful set of tools for troubleshooting network and system issues. By running these scripts, you can quickly identify connectivity problems, network performance issues, and system-level errors. This toolkit is designed for quick diagnostics and can be expanded with additional tests and logging features as needed.

