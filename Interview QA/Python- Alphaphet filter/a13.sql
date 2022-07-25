class LetterFilter:

    def __init__(self, s):
        self.s = s
    
# Enter your code here. 
# Complete the classes below.
# Reading the inputs and writing the outputs are already done for you.
#
# class LetterFilter:
#
#   def __init__(self, s):
#       self.s = s
    
    def filter_vowels(self):
        # Enter your code here
        # Return a string
        cons = [letter for letter in self.s if  self.vowel(letter)]
        fword = ''.join(cons)
        return fword 
     
    def filter_consonants(self):
        # Enter your code here
        # Return a string
        cons = [letter for letter in self.s if not self.vowel(letter)]
        fword = ''.join(cons)
        return fword 
    
    def vowel(self,letter):
        vowels = ['a','e','i','o','u']
        if letter.lower() in vowels:
            return True
        else:
            return False
        
        
s = raw_input()
f = LetterFilter(s)
print f.filter_vowels()
print f.filter_consonants()