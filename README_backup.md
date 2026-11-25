# Linux Usage Monitoring and Backup Dashboard

## 1. Project Overview

The Linux Usage Monitoring and Backup Dashboard is a Bash-based project designed to monitor Linux system resources, manage backups, analyze system logs, and generate a complete system status report through a single interactive dashboard.

## 2. Project Objectives

- Monitor CPU, memory, and disk usage.
- Create backups of important files and directories.
- Restore files from previously created backups.
- Analyze system logs and identify important events.
- Generate a complete system status report.
- Provide an interactive menu to access all modules.

## 3. Features

### Option 1: System Monitoring
Displays system information and resource usage, including CPU, memory, and disk information.

### Option 2: Backup and Restoration
Creates compressed backups and restores previously backed-up files.

### Option 3: Log Analysis
Analyzes system log files and displays relevant log information.

### Option 4: Full Status Report
Combines system monitoring, backup information, and log analysis into a complete status report.

### Option 5: Exit
Safely exits the dashboard.

## 4. Project Structure

```text
Lab7_Capstone/
├── dashboard.sh
├── monitor.sh
├── backup.sh
├── log_analyzer.sh
├── README.md
├── sample_logs/
├── test_data/
├── backups/
├── restored_files/
└── reports/
```

## 5. Requirements

- Linux Operating System (Ubuntu)
- Bash Shell
- Basic Linux command-line utilities
- Tar utility for compressed backups

## 6. Installation and Execution

Navigate to the project directory:

```bash
cd ~/Lab7_Capstone
```

Give execution permissions:

```bash
chmod +x dashboard.sh monitor.sh backup.sh log_analyzer.sh
```

Run the dashboard:

```bash
./dashboard.sh
```

## 7. Testing

The following dashboard options were tested:

- System Monitoring
- Backup and Restoration
- Log Analysis
- Full Status Report
- Exit

A quick re-test was performed after script optimization to verify that all dashboard modules were connected correctly.

## 8. Conclusion

The project successfully integrates multiple Linux system administration tasks into a single Bash-based dashboard. It demonstrates shell scripting, system monitoring, backup management, log analysis, and automation concepts.
