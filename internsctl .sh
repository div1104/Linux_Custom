#!/bin/bash

SCRIPT_NAME=$0

VERSION="v0.1.0"


USAGE_HELP="Usage: $SCRIPT_NAME [--version] [--help] [--man] "

function print_manual() {
cat <<EOF
INTERNSCTL(1)                         Utility Manual                         INTERNSCTL(1)

NAME
       internsctl - Custom command for managing intern operations.

SYNOPSIS
       internsctl [--version] [--help] [--man] 

DESCRIPTION
       Internsctl is a custom command for managing intern operations.

       The following options are available:

       --version    Display the version number of internsctl.

       --help       Display help information for using internsctl.

       --man        Display the manual page for internsctl.


AUTHOR
       The Internsctl development team <developers@example.com>

REPORTING BUGS
       Bugs can be reported at <https://github.com/example/internsctl/issues>

COPYRIGHT
       Copyright (C) 2022 The Internsctl development team. This is free software.
       You can redistribute it and/or modify it under the terms of the MIT license.
       For more details, see the LICENSE file distributed with internsctl.

INTERNSCTL(1)                         Utility Manual                         INTERNSCTL(1)
EOF
}

function handle_options() {
    while [ -n "$1" ]; do
        case "$1" in
            --version)
                echo "$SCRIPT_NAME version $VERSION"
                exit 0
                ;;
            --help)
                echo "$USAGE_HELP"
                exit 0
                ;;
            --man)
                print_manual
                exit 0
                ;;
            *)
                echo "$USAGE_HELP"
                exit 1
                ;;
        esac
        shift
    done
}


handle_options "$@"