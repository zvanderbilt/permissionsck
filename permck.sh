#!/bin/bash

# exit this bash script if any statement returns a non-true return value (same as: set -e)
set -o errexit

if [ -z "$1" ]; then
    echo
    echo "ERROR: Must pass parameter of path to directory (which will have permissions set accordingly; 775 directories and 660 files)."
    echo "USAGE: $0 /Path/To/Directory/"
    echo
    exit 1
fi

echo
echo "Working recursively with directory $1 this script will chmod 775 all directories and chmod 660 all files."

read -p "Okay to continue (y/n)? "
if [ "$REPLY" != "y" ]; then
    echo
    echo "EXITING -- NO ACTION TAKEN."
    echo
    exit 1
fi

echo
echo "Starting..."
echo

find "$1" -type d -print0 | xargs -0 chmod 775
find "$1" -type f -print0 | xargs -0 chmod 660

echo "Done."
echo

exit 0
