
#!/bin/bash

# Log Analyzer Script

echo "======================================"
echo "          LOG ANALYZER"
echo "======================================"

if [ $# -eq 0 ]; then
    echo "Usage: ./log_analyzer.sh <log_file>"
    exit 1
fi

for logfile in "$@"
do
    echo ""
    echo "Analyzing: $logfile"

    if [ ! -f "$logfile" ]; then
        echo "Error: File does not exist!"
        continue
    fi

    total_lines=$(wc -l < "$logfile")

    error_count=$(grep -ic "error" "$logfile")
    warning_count=$(grep -ic "warning" "$logfile")
    critical_count=$(grep -ic "critical" "$logfile")

    info_count=$(awk 'tolower($0) ~ /info/ {count++} END {print count+0}' "$logfile")

    echo "Total Log Lines: $total_lines"
    echo "Total Errors: $error_count"
    echo "Total Warnings: $warning_count"
    echo "Total Critical Messages: $critical_count"
    echo "Total Info Messages: $info_count"

    echo ""
    echo "----- ERROR DETAILS -----"

    if [ "$error_count" -gt 0 ]; then
        grep -in "error" "$logfile"
    else
        echo "No errors found."
    fi

    echo ""
    echo "Log analysis completed."

done

echo ""
echo "======================================"
echo "       ANALYSIS FINISHED"
echo "======================================"
