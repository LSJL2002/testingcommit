#!/bin/bash

# Get CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Get CPU temperature (if available)
cpu_temp=$(sensors | grep "Core 0" | awk '{print $3}' | sed 's/+//' | sed 's/\..*//')

# Get CPU frequency
cpu_freq=$(cat /proc/cpuinfo | grep "cpu MHz" | head -n 1 | awk '{print $4}')

# Print the CPU status
echo "CPU Usage: ${cpu_usage}%"
if [ ! -z "$cpu_temp" ]; then
  echo "CPU Temperature: ${cpu_temp}°C"
else
  echo "CPU Temperature: N/A"
fi
if [ ! -z "$cpu_freq" ]; then
  echo "CPU Frequency: ${cpu_freq} MHz"
else
  echo "CPU Frequency: N/A"
fi
