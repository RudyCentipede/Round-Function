#!/bin/bash
verbose=false
if [[ "$1" == "-v" ]]; then
    verbose=true
    shift
fi

if [[ $# -ne 2 ]]; then
    echo "Usage: $0 [-v] file1 file2"
    exit 1
fi

content1=$(awk '/string:/{print $0}' "$1")
content2=$(awk '/string:/{print $0}' "$2")

if [[ "$content1" == "$content2" ]]; then
    exit 0
else
    if [[ "$verbose" == "true" ]]; then
        echo "Contents of $1 and $2 are not equal"
    fi
    exit 1
fi
