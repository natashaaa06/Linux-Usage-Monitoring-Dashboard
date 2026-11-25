
#!/bin/bash

# backup.sh - Backup and Restoration Script

echo "======================================"
echo "       BACKUP AND RESTORE TOOL"
echo "======================================"

# Function to create backup
create_backup() {

    echo ""
    read -p "Enter source directory: " source
    read -p "Enter destination directory: " destination

    # Check source directory
    if [ ! -d "$source" ]; then
        echo "Error: Source directory does not exist!"
        return 1
    fi

if [ -z "$(ls -A "$source")" ]; then
    echo "Error: Source directory is empty!"
    return 1
fi

    # Create destination directory
    mkdir -p "$destination" || {
        echo "Error: Cannot create destination directory!"
        return 1
    }

    # Create backup file
    backup_file="$destination/backup_$(date +%Y%m%d_%H%M%S).tar.gz"

    tar -czf "$backup_file" -C "$(dirname "$source")" "$(basename "$source")"

    # Verify backup
    if [ $? -eq 0 ] && [ -s "$backup_file" ]; then
        echo ""
        echo "Backup created successfully!"
        echo "Backup file: $backup_file"
    else
        echo "Backup failed!"
        return 1
    fi
}

# Function to restore backup
restore_backup() {

    echo ""
    read -p "Enter backup file path: " backup_file
    read -p "Enter restore destination: " restore_dir

    if [ ! -f "$backup_file" ]; then
        echo "Error: Backup file not found!"
        return 1
    fi

    if ! tar -tzf "$backup_file" >/dev/null 2>&1; then
        echo "Error: Invalid or damaged backup file!"
        return 1
    fi

    mkdir -p "$restore_dir" || {
        echo "Error: Cannot create restore directory!"
        return 1
    }

    tar -xzf "$backup_file" -C "$restore_dir"

    if [ $? -eq 0 ]; then
        echo "Files restored successfully!"
        echo "Restore location: $restore_dir"
    else
        echo "Restoration failed!"
        return 1
    fi
}

# Main menu
echo "1. Create Backup"
echo "2. Restore Backup"

read -p "Enter your choice: " choice

case $choice in
    1)
        create_backup
        ;;
    2)
        restore_backup
        ;;
    *)
        echo "Invalid choice!"
        ;;
esac

echo ""
echo "Backup operation completed."
