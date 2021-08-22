#!/bin/bash

NUM_ARGS=2;
E_BAD_ARGS=86;
E_FILE_NOT_READABLE=87;

if [ $# -ne 2 ]; then
	echo "Usage : `basename $0` file1 file2";
	exit $E_BAD_ARGS;
fi;

if [[ ! -r $1 ]]; then
	echo "File 1 $1 unreadable"
	exit $E_FILE_NOT_READABLE;
fi;

if [[ ! -r $2 ]]; then
        echo "File 2 $2 unreadable"
        exit $E_FILE_NOT_READABLE;
fi;


cmp $1 $2 &> /dev/null

if [ $? -eq 0 ]; 
then
	echo "Files are identical";

else 
	echo "Files are not the same"

fi;

exit 0;
