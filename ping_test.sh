#!/bin/bash

echo "Enter the host to ping:"
read host

echo "Pinching $host..."
ping -c 4 $host
