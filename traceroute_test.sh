#!/bin/bash

echo "Enter the host for tracerout:"
read host

echo "Traceing route to $host"
traceroute $host
