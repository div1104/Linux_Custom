#!/bin/bash

if [ "$1" == "user" ] && [ "$2" == "create" ]; then
    if [ -z "$3" ]; then
        echo "Usage: internsctl user create <username>"
    else
        sudo useradd -m -s /bin/bash "$3"
        echo "User '$3' created successfully."
    fi
elif [ "$1" == "user" ] && [ "$2" == "list" ]; then
    # List all regular users
    cut -d: -f1,7 /etc/passwd | awk -F: '$2!~/\/(nologin|false)/ {print $1}'
elif [ "$1" == "user" ] && [ "$2" == "list" ] && [ "$3" == "--sudo-only" ]; then
    # List users with sudo permissions
    getent group sudo | cut -d: -f4 | tr ',' '\n'
else
    echo "Usage:"
    echo "  internsctl user create <username>"
    echo "  internsctl user list"
    echo "  internsctl user list --sudo-only"
fi
