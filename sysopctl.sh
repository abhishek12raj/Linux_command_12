#!/bin/bash

VERSION="v0.1.0"

# Load helper functions
source ./functions/service.sh
source ./functions/system.sh
source ./functions/disk.sh
source ./functions/process.sh
source ./functions/logs.sh
source ./functions/backup.sh

# Handle help and version
if [[ "$1" == "--help" ]]; then
    echo "Usage: sysopctl <command>"
    echo "Commands:"
    echo "  service list              List all active services"
    echo "  service start <name>      Start a service"
    echo "  service stop <name>       Stop a service"
    echo "  system load               Show system load"
    echo "  disk usage                Show disk usage"
    echo "  process monitor           Monitor system processes"
    echo "  logs analyze              Analyze system logs"
    echo "  backup <path>             Backup system files"
    exit 0
fi

if [[ "$1" == "--version" ]]; then
    echo "sysopctl version $VERSION"
    exit 0
fi

# Command handling
case "$1" in
    service)
        case "$2" in
            list) service_list ;;
            start) service_start "$3" ;;
            stop) service_stop "$3" ;;
            *) echo "Unknown service command" ;;
        esac
        ;;
    system)
        case "$2" in
            load) system_load ;;
            *) echo "Unknown system command" ;;
        esac
        ;;
    disk)
        case "$2" in
            usage) disk_usage ;;
            *) echo "Unknown disk command" ;;
        esac
        ;;
    process)
        case "$2" in
            monitor) process_monitor ;;
            *) echo "Unknown process command" ;;
        esac
        ;;
    logs)
        case "$2" in
            analyze) logs_analyze ;;
            *) echo "Unknown logs command" ;;
        esac
        ;;
    backup)
        backup_files "$2"
        ;;
    *)
        echo "Unknown command. Use --help for usage."
        ;;
esac
