#!/bin/sh
# Script that counts the number of words in a book

# Has a filename for the book been provided?
thebook="$1"
if [ -z "$thebook" ] ; then
    echo "Please provide the filename of the book."
    exit 1
elif [ ! -f "$thebook" ] ; then
    echo "$thebook was not found."
    exit 1
fi

# Create output directory
mkdir -p "output"

# Count the words and output the results
OUTPUTFILE="output/wordcount.txt"
cat $thebook | ./mapper.py | sort | ./reducer.py > $OUTPUTFILE
echo "Word count saved as $OUTPUTFILE" 

