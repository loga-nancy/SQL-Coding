#!/bin/python3

import math
import os
import random
import re
import sys


#
# Complete the 'stop_words' function below.
#
# The function is expected to return a STRING_ARRAY.
# The function accepts following parameters:
#  1. STRING text
#  2. INTEGER k
#

def stopWords(text, k):
    # Write your code here
    d = {}
    result=list()
    for i in text.lower().split(' '):
        if i in d.keys():
            d[i] +=1
        else:
            d[i] = 1
    
    for key,val in d.items():
        if val >= k:
            result.append(key)
            
    return result
            
    
if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    text = input()

    k = int(input().strip())

    result = stopWords(text, k)

    fptr.write('\n'.join(result))
    fptr.write('\n')

    fptr.close()
