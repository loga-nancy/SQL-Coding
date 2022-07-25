
def stopWords(text, k):
    # Write your code here
    d = []
    result=list()
    for i in text.lower().split(' '):
        d.append(i)
        print(Counter(d))
    
    for key,val in d.items():
        if val >= k:
            result.append(key)
            
    return result

print(stopWords('hi how are you hi how means',2))        
