#!/bin/bash

echo -n "file1 equal file2: "
./comparator2.sh tests/file1 tests/file2
if [[ $? -eq 1 ]]; then
    echo False
else
    echo True
fi

echo -n "file2 equal file3: "
./comparator2.sh tests/file2 tests/file3
if [[ $? -eq 1 ]]; then
    echo False
else
    echo True
fi

echo -n "file1 equal file3: "
./comparator2.sh tests/file1 tests/file3
if [[ $? -eq 1 ]]; then
    echo False
else
    echo True
fi