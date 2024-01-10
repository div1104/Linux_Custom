#!/bin/bash

if [ "$1" == "file" ] && [ "$2" == "getinfo" ]; then
    if [ -z "$3" ]; then
        echo "Usage: internsctl file getinfo [options] <file-name>"
        echo "Options:"
        echo "  --size, -s             Print file size"
        echo "  --permissions, -p     Print file permissions"
        echo "  --owner, -o            Print file owner"
        echo "  --last-modified, -m    Print last modification time"
    else
        FILE="$3"
        SIZE_OPTION=false
        PERMISSIONS_OPTION=false
        OWNER_OPTION=false
        LAST_MODIFIED_OPTION=false

        # Parse options
        while [ $# -gt 3 ]; do
            case "$4" in
                --size|-s)
                    SIZE_OPTION=true
                    ;;
                --permissions|-p)
                    PERMISSIONS_OPTION=true
                    ;;
                --owner|-o)
                    OWNER_OPTION=true
                    ;;
                --last-modified|-m)
                    LAST_MODIFIED_OPTION=true
                    ;;
                *)
                    echo "Invalid option: $4"
                    exit 1
                    ;;
            esac
            shift
        done

        # Display file information
        echo "File: $FILE"
        [ "$SIZE_OPTION" = true ] && echo "Size(B): $(stat -c%s "$FILE")"
        [ "$PERMISSIONS_OPTION" = true ] && echo "Access: $(stat -c%a "$FILE")"
        [ "$OWNER_OPTION" = true ] && echo "Owner: $(stat -c%U "$FILE")"
        [ "$LAST_MODIFIED_OPTION" = true ] && echo "Modify: $(stat -c%y "$FILE")"
    fi
else
    echo "Usage: internsctl file getinfo [options] <file-name>"
    echo "Options:"
    echo "  --size, -s             Print file size"
    echo "  --permissions, -p     Print file permissions"
    echo "  --owner, -o            Print file owner"
    echo "  --last-modified, -m    Print last modification time"
fi
