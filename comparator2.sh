#!/bin/bash
verbose=false
if [[ "$3" == "-v" ]]; then
    verbose=true
fi

if [[ "$verbose" == true ]]; then
    if [[ $# -ne 3 ]]; then
        echo "Usage: $0 file1 file2 [-v]"
        exit 1
    fi
else
    if [[ $# -ne 2 ]]; then
        exit 1
    fi
fi

if ! [ -f "$1" ]; then
    if [[ "$verbose" == "true" ]]; then
        echo "File1 does not exist"
    fi
    exit 1
fi

if ! [ -f "$2" ]; then
    if [[ "$verbose" == "true" ]]; then
        echo "File2 does not exist"
    fi
    exit 1
fi

content1=$(grep "string:"  "$1" | cut -d':' -f2-)
content2=$(grep "string:"  "$1" | cut -d':' -f2-)

if [[ "$content1" == "$content2" ]]; then
    if [[ "$verbose" == "true" ]]; then
        echo "Contents of $1 and $2 are equal"
    fi
    exit 0
else
    if [[ "$verbose" == "true" ]]; then
        echo "Contents of $1 and $2 are not equal"
    fi
    exit 1
fi
