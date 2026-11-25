# Linux Usage Monitoring and Backup Dashboard

## 1. Project Overview

The Linux Usage Monitoring and Backup Dashboard is a Bash-based system administration toolkit developed to simplify common Linux administration tasks through a single interactive dashboard.

The project integrates system resource monitoring, backup and restoration, log analysis, and system status reporting into one menu-driven application.

## 2. Project Objectives

- Monitor CPU, memory, and disk usage.
- Create compressed backups of important directories.
- Restore files from previously created backups.
- Analyze log files to identify errors, warnings, and critical messages.
- Generate a combined system monitoring and log analysis report.
- Provide a user-friendly interactive dashboard.

## 3. Technologies Used

- Operating System: Ubuntu Linux
- Scripting Language: Bash Shell
- Text Processing: AWK, GREP
- System Monitoring: TOP, FREE, DF
- Backup Utility: TAR
- Text Editor: Mousepad

## 4. Project Features

### Option 1: System Monitoring

The monitoring module displays:

- CPU usage percentage.
- Memory usage information.
- Disk usage information.
- System resource statistics.

### Option 2: Backup and Restoration

The backup module provides two operations:

**Create Backup**
- Accepts a source directory.
- Accepts a destination directory.
- Checks whether the source directory exists and is not empty.
- Creates a compressed TAR.GZ backup.
- Verifies successful backup creation.

**Restore Backup**
- Accepts an existing backup file.
- Validates the backup archive.
- Creates the restoration destination if required.
- Extracts the backed-up files.

### Option 3: Log Analysis

The log analyzer processes log files and identifies:

- Total number of log lines.
- Error messages.
- Warning messages.
- Critical messages.
- Informational messages.
- Detailed error entries.

It also supports processing multiple log files.

### Option 4: Full Status Report

This option combines:

- System monitoring information.
- Log analysis of available sample log files.

It displays the results in one dashboard operation.

### Option 5: Exit

Safely terminates the dashboard application.

## 5. Project Structure

```text
Lab7_Capstone/
├── dashboard.sh
├── monitor.sh
├── backup.sh
├── log_analyzer.sh
├── README.md
├── sample_logs/
│   ├── system.log
│   └── empty.log
├── test_data/
├── backups/
├── restored_files/
└── reports/
```

## 6. System Requirements

- Ubuntu Linux
- Bash Shell
- TAR utility
- Basic Linux command-line utilities
- AWK and GREP

## 7. Installation and Execution

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

Follow the on-screen menu to access the required functionality.

## 8. Testing and Validation

The following tests were performed:

| Test | Result |
|---|---|
| System Monitoring | Passed |
| Backup Creation | Passed |
| Backup Restoration | Passed |
| Log Analysis | Passed |
| Full Status Report | Tested |
| Dashboard Exit | Passed |
| Script Syntax Validation | Passed |

All four Bash scripts were checked using the `bash -n` command. No syntax errors were reported.

A quick re-test was also performed after script improvements to verify dashboard integration
## 9. Conclusion

The Linux Usage Monitoring and Backup Dashboard successfully integrates multiple system administration tasks into a single Bash-based application.

The project demonstrates practical knowledge of shell scripting, system monitoring, file management, backup and restoration, log processing, error handling, and command-line automation.

It provides a simple and organized approach to performing common Linux administration operations.
