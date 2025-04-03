# vm-health-check
This script analyzes the health of a virtual machine running Ubuntu based on CPU, memory, and disk space utilization. If any of these metrics exceed 60%, the script declares the VM as "Not Healthy"; otherwise, it is "Healthy".

# How It Works

1. **CPU Usage Calculation**
    - Uses the top command to extract CPU idle percentage.
    - Calculates CPU usage as 100 - idle percentage.

2. **Memory Usage Calculation**
    - Uses the free command to determine memory consumption.
    - Calculates memory usage as (used memory / total memory) * 100.
4. **Disk Usage Calculation**
    - Uses the df command to find disk usage of the root filesystem (/).
    - Extracts the percentage of used space.
5. **Health Status Determination**
     - If any usage metric is above 60%, the VM is "Not Healthy".
     - Otherwise, it is "Healthy".
6. **Explanation Mode**
     - When run with explain as an argument, the script provides detailed utilization statistics.


# Usage
Run the script using:
         
          bash vm_health_check.sh
          
To get a detailed explanation of the health status:

          bash vm_health_check.sh explain

# Requirements
    - Ubuntu OS
    - awk, bc, and sed must be available (pre-installed on most Ubuntu distributions).

# Example Output
          VM Health Status: Not Healthy
          Explanation:
          CPU Usage: 70.5%
          Memory Usage: 65.3%
          Disk Usage: 72%
