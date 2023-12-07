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
        echo "Usage: $0 file1 file2 [-v]"
        exit 1
    fi
fi

content1=$(awk -F 'string:' '{print $2}' "$1")
content2=$(awk -F 'string:' '{print $2}' "$2")
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
