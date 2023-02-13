#!/bin/bash

is_directory_to_purge() {
    directory_to_test=$1
    folders_to_purge=(`echo $2 | sed 's/,/\n/g'`)
    local result=0

   for folder in "${folders_to_purge[@]}"
   do
        if [[ "$directory_to_test" == *"$folder"* ]]; then
            result=1
        fi
   done
   echo $result
}

purge_directory() {
  pivot_directory=$1

  folders_to_purge_original=$2

  for entry in "$pivot_directory"/* 
  do
    if [ -d "$entry" ];
    then # is a directory
        is=`is_directory_to_purge "$entry" "$folders_to_purge_original"`
        if [ $is -eq 1 ];
        then 
            echo "Removing: [ $entry ]"
            rm -rf $entry
        else
            purge_directory "$entry" "$folders_to_purge_original"
        fi
    fi
  done
}

PIVOT_PATH=""
TO_REMOVE=""

for ((i = 1; i <= $#; i++ )); do
    paramter=${!i}
    if [ $paramter = "-p" ];
    then
        j=$(($i+1))
        PIVOT_PATH=${!j}
    fi
    if [ $paramter = "--path" ];
    then
        j=$(($i+1))
        PIVOT_PATH=${!j}
    fi
    if [ $paramter = "-r" ];
    then
        j=$(($i+1))
        TO_REMOVE=${!j}
    fi
    if [ $paramter = "--to-remote" ];
    then
        j=$(($i+1))
        TO_REMOVE=${!j}
    fi
done

if [ -z $PIVOT_PATH ]; then
    echo "Using default value"
    PLATTAFORM=$PWD
fi

echo "\$PIVOT_PATH= "$PIVOT_PATH
echo "\$TO_REMOVE= "$TO_REMOVE

purge_directory "$PIVOT_PATH" "$TO_REMOVE"
