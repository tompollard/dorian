#! /usr/bin/env python

import sys
import re

def mapper(argv): 
    pattern = re.compile('[a-zA-Z][a-zA-Z0-9]*') 
    for line in sys.stdin: 
        for word in pattern.findall(line): 
            print word.lower() + '\t' + '1'

# def mapper(inputdata):
#     for line in inputdata:
#         line = line.strip()
#         unpacked = line.split(",")
#         time, variable, value = line.split(",")
#         results = [variable, "1"]
#         print("\t".join(results))

mapper(sys.stdin)