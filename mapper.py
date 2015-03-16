#!/usr/bin/env python

import sys
import re

def mapper(stream): 
    pattern = re.compile('[a-zA-Z][a-zA-Z0-9]*') 
    for line in stream: 
        for word in pattern.findall(line): 
            print word.lower() + '\t' + '1'

mapper(sys.stdin)