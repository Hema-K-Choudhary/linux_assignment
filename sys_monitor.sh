#!/bin/bash

# Set log file location in current user's directory
LOG_DIR="$HOME/Library/Logs/system_monitoring"
LOG_FILE="$LOG_DIR/system_stats_$(date +%Y%m%d).log"

# Create log directory if it doesn't exist
mkdir -p "$LOG_DIR"

# Function to log with timestamp
log_with_timestamp() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# System monitoring header
log_with_timestamp "=== System Monitoring Report ==="

# CPU and Memory Usage
log_with_timestamp "--- CPU and Memory Usage ---"
top -l 1 -n 5 -s 0 >> "$LOG_FILE"

# Disk Usage
log_with_timestamp "--- Disk Usage ---"
df -h >> "$LOG_FILE"

# Directory Sizes (only check current user's directory)
log_with_timestamp "--- Important Directory Sizes ---"
du -sh "$HOME/Documents" "$HOME/Downloads" "$HOME/Desktop" 2>/dev/null >> "$LOG_FILE"

# Top 5 Resource-Intensive Processes
log_with_timestamp "--- Top 5 Resource-Intensive Processes ---"
ps aux | sort -r -k 3,3 | head -6 >> "$LOG_FILE"

# Set appropriate permissions
chmod 644 "$LOG_FILE"



# Make the script executable
# chmod +x sys_monitor.sh

# Run the script
# ./sys_monitor.sh

# View the logs
# cat "$HOME/Library/Logs/system_monitoring/system_stats_$(date +%Y%m%d).log"