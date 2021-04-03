#!/bin/bash

input="packages.csv"
while IFS=',' read -r col1 col2 col3 dummy
do
   array+=("$col1")
   array+=("$col2")
   array+=("$col3")
done < <(tail -n +2 "$input")

option=$(dialog --checklist --output-fd 1 "Choose packages:" 10 60 4 "${array[@]}")

exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "$option"
else
    echo "Cancel"
fi
