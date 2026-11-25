
#!/bin/bash

# System Monitoring Script

echo "========================================"
echo "       SYSTEM MONITORING REPORT"
echo "========================================"

# Check required commands
for cmd in top free df awk
do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Error: $cmd command is not available."
        exit 1
    fi
done

# CPU Usage
echo ""
echo "----- CPU USAGE -----"

cpu_idle=$(top -bn1 | awk -F',' '/Cpu\(s\)/ {
    for(i=1; i<=NF; i++) {
        if($i ~ /id/) {
            gsub(/[^0-9.]/, "", $i)
            print $i
            exit
        }
    }
}')

if [ -n "$cpu_idle" ]; then
    cpu_usage=$(awk -v idle="$cpu_idle" 'BEGIN {printf "%.2f", 100-idle}')
    echo "CPU Usage: $cpu_usage%"
else
    echo "CPU Usage: Unable to calculate"
fi

# Memory Usage
echo ""
echo "----- MEMORY USAGE -----"

free -h

memory_usage=$(free | awk '/Mem:/ {
    if ($2 > 0)
        printf "%.2f", ($3/$2)*100
}')

echo "Memory Usage: $memory_usage%"

# Disk Usage
echo ""
echo "----- DISK USAGE -----"

df -h /

echo ""
echo "========================================"
echo "     MONITORING COMPLETED"
echo "========================================"

echo ""
echo "========================================"
echo "     MONITORING COMPLETED"
echo "========================================"
