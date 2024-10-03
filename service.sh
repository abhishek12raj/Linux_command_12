#!/bin/bash

service_list() {
    systemctl list-units --type=service
}

service_start() {
    if [[ -z "$1" ]]; then
        echo "Error: No service specified."
    else
        systemctl start "$1"
        echo "Service $1 started."
    fi
}

service_stop() {
    if [[ -z "$1" ]]; then
        echo "Error: No service specified."
    else
        systemctl stop "$1"
        echo "Service $1 stopped."
    fi
}
