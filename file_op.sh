#!/bin/bash

ARGS=2
E_NO_ARGS=101
E_BAD_ARGS=102
E_FILE_NOT_READABLE=103
E_FILE_NOT_EXECUTABLE=104
E_FILE_SIZE=105

if [[ -z "$1" && -z "$2" ]]; then
        echo "Incorrect arguments"
        exit "$E_NO_ARGS"
fi;

if [ $# -ne "$ARGS" ]; then
        echo "Usage: `basename $0` file1 file2"
        exit "$E_BAD_ARGS"
fi;

if [[ -e "$1" && -e "$2" ]]; then
        if [[ ! -f "$1" || ! -f "$2" ]]; then
                echo "Please enter file names that are not directories.";
                exit "$E_BAD_ARGS"
        elif [[ ! -r "$1" || ! -r "$2" ]]; then
                echo "Files are not readable";
                exit "$E_FILE_NOT_READABLE"
        elif [[ ! -x "$1" || ! -x "$2" ]]; then         
                echo "Files are not executable";
                exit "$E_FILE_NOT_EXECUTABLE"
        elif [[ ! -s "$1" || ! -s "$2" ]]; then
                echo "Files are empty";
                exit "$E_FILE_SIZE";
        fi;
else
        echo "Files Do not exist"
        exit "$E_BAD_ARGS";
fi;

cat $1 $2 > tmp.txt

if [ $? -eq 0 ]; then
	echo "Script execution successful"
	cat tmp.txt

else
	echo "Script execution failed";
fi;

