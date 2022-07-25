from typing import Counter


a=['b','a','b','z','i']
b=Counter(a)
result=list()
for key,val in b.items():
    if val>1:
        result.append(key)
    