#!/bin/bash

word=engineer
echo "The ${word} occurance is:"
grep -o "engineer" /home/marian/Documents/work/Linux/team.txt | wc -l

#start=`date +%s`
#stuff
#end=`date +%s`
#runtime=$((end-start))
echo
echo "Time needed for script to find the solution:"
time


