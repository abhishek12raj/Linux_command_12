#!/bin/bash

backup_files() {
    if [[ -z "$1" ]]; then
        echo "Error: No path specified."
    else
        rsync -av --progress "$1" /backup/
        echo "Backup complete for $1."
    fi
}
