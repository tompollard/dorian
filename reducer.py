#!/usr/bin/env python

import sys

def reducer(stream):
    mydict = {}
    line = stream.readline()
    while line:
        
        # Get the key/value pair
        line = line.strip()
        word, count = line.split('\t')
        count = int(count)

        # Add to the dict
        if word in mydict:
            mydict[word] += 1
        else:
            mydict[word] = 1

        # Get the next line
        line = stream.readline()

    # Print the aggregated key/value pairs
    # for word in sorted(mydict.keys()): # order by word
    for word in sorted(mydict, key=mydict.get, reverse=True): # or by count
        print word, '\t', mydict[word]

reducer(sys.stdin)
