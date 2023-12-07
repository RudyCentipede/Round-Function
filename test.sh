#!/bin/bash

./comparator2.sh tests/file1 tests/file2
if [[ $? -eq 1 ]]; then
    echo Fail
else
    echo OK
fi

./comparator2.sh tests/file2 tests/file3
if [[ $? -eq 1 ]]; then
    echo Fail
else
    echo OK
fi

./comparator2.sh tests/file1 tests/file3
if [[ $? -eq 1 ]]; then
    echo Fail
else
    echo OK
fi