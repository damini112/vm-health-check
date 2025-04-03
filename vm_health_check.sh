#!/bin/bash

# Function to calculate CPU usage
get_cpu_usage() {
    cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk '{print $8}')
    cpu_usage=$(echo "100 - $cpu_idle" | bc)
    echo "$cpu_usage"
}

# Function to calculate Memory usage
get_memory_usage() {
    memory_usage=$(free | awk '/Mem/ {printf("%.2f", $3/$2 * 100)}')
    echo "$memory_usage"
}

# Function to calculate Disk usage
get_disk_usage() {
    disk_usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
    echo "$disk_usage"
}

cpu_usage=$(get_cpu_usage)
memory_usage=$(get_memory_usage)
disk_usage=$(get_disk_usage)

# Determine health status
if (( $(echo "$cpu_usage > 60" | bc -l) )) || \
   (( $(echo "$memory_usage > 60" | bc -l) )) || \
   (( $disk_usage > 60 )); then
    health_status="Not Healthy"
else
    health_status="Healthy"
fi

# Output the health status
echo "VM Health Status: $health_status"

# If 'explain' argument is provided, print explanations
if [[ "$1" == "explain" ]]; then
    echo "Explanation:"
    echo "CPU Usage: $cpu_usage%"
    echo "Memory Usage: $memory_usage%"
    echo "Disk Usage: $disk_usage%"
fi
