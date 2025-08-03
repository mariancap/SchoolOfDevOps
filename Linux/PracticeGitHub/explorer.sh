#!/bin/bash
echo -e "Welcome the a Futuristic Summer!\n"

echo -e "Files and directories in the current path:\n"
echo "$(ls -lsh | awk '{print $6,$10}')"

while true
do

read -p "Read a line of text:" text
if [ ${#text} -eq 0 ];
then break
else
echo -e "\nCharacter count:"
echo ${#text}
fi
done
