#!/bin/sh

# Save wordcount
OUTPUTFILE="output/counted.txt"
cat dorian.txt | ./mapper.py | sort | ./reducer.py > $OUTPUTFILE

