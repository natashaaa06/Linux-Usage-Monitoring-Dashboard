
#!/bin/bash

# dashboard.sh - Linux Administration and Automation Toolkit

# Get project directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

cd "$SCRIPT_DIR" || exit 1

LOGDIR="sample_logs"

# Function to display menu
show_menu() {
    echo ""
    echo "============================================"
    echo " LINUX SYSTEM ADMINISTRATION TOOLKIT"
    echo "============================================"
    echo "1. System Monitoring Report"
    echo "2. Run Backup and Restoration"
    echo "3. Analyze Logs"
    echo "4. Full Status Report"
    echo "5. Exit"
    echo "============================================"
}

# Main program
while true
do
    show_menu

    read -r -p "Enter your choice: " choice

if [[ ! "$choice" =~ ^[1-5]$ ]]; then
    echo "Invalid choice! Enter a number between 1 and 5."
    continue
fi

    case $choice in

        1)
            echo ""
            echo "Starting System Monitoring..."
            bash "$SCRIPT_DIR/monitor.sh"
            ;;

        2)
            echo ""
            echo "Starting Backup and Restoration..."
            bash "$SCRIPT_DIR/backup.sh"
            ;;

        3)
            echo ""
            read -r -p "Enter log file path: " logfile

            if [ -f "$logfile" ]; then
                bash "$SCRIPT_DIR/log_analyzer.sh" "$logfile"
            else
                echo "Error: Log file does not exist!"
            fi
            ;;

        4)
            echo ""
            echo "========== FULL STATUS REPORT =========="

            echo ""
            echo "----- SYSTEM MONITORING -----"
            bash "$SCRIPT_DIR/monitor.sh"

            echo ""
            echo "----- LOG ANALYSIS -----"

            log_files=("$LOGDIR"/*.log)

            if [ -f "${log_files[0]}" ]; then
                bash "$SCRIPT_DIR/log_analyzer.sh" "${log_files[@]}"
            else
                echo "No log files found!"
            fi

            echo ""
            echo "========== REPORT COMPLETED =========="
            ;;

        5)
            echo ""
            echo "Thank you for using the toolkit!"
            echo "Exiting program..."
            break
            ;;

        *)
            echo ""
            echo "Invalid choice! Please enter a number from 1 to 5."
            ;;

    esac

    echo ""
    read -r -p "Press Enter to return to the main menu..." pause

done
