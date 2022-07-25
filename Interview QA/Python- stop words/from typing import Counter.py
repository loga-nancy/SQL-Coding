from typing import Counter


def stopWords(text, k):
    # Write your code here
    d = []
    result=list()
    for i in text.lower().split(' '):
        d.append(i)
        b=Counter(d)

    for key,val in b.items():
        if val >= k:
            result.append(key)
            
    return result

print(stopWords('hi how are you hi how means',2))   
