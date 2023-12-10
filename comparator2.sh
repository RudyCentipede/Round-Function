#!/bin/bash
verbose=false

if [[ $# == 3 ]]; then
    if [[ "$1" != "-v" && "$2" != "-v" && "$3" == "-v" ]]; then
        verbose=true
        file1="$1"
        file2="$2"

    else
        echo "Usage: $0 file1 file2 [-v]"
        exit 1
    fi
elif [[ $# == 2 ]]; then
    if [[ "$1" != "-v" && "$2" != "-v" ]]; then
        file1="$1"
        file2="$2"
    else
        echo "Usage: $0 file1 file2 [-v]"
        exit 1
    fi
else
    echo "Usage: $0 file1 file2 [-v]"
    exit 1
fi

if ! [ -f "$file1" ]; then
    if [[ "$verbose" == "true" ]]; then
        echo "$file1 does not exist"
    fi
    exit 1
fi

if ! [ -f "$file2" ]; then
    if [[ "$verbose" == "true" ]]; then
        echo "$file2 does not exist"
    fi
    exit 1
fi

content1=$(cat "$file1")
content1=${content1#*string:}
content2=$(cat "$file2")
content2=${content2#*string:}

if [[ "$content1" == "$content2" ]]; then
    if [[ "$verbose" == "true" ]]; then
        echo "Contents of $file1 and $file2 are equal"
    fi
    exit 0
else
    if [[ "$verbose" == "true" ]]; then
        echo "Contents of $file1 and $file2 are not equal"
    fi
    exit 1
fi
