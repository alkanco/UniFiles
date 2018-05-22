import sys

def countLetters(list):
    #Create Dictionary
    countDict = {}
    #Go through given list
    for letter in list:
        #Count element in dictionary
        countDict[letter] = countDict.get(letter, 0) + 1
    #Return finished dictionary
    return countDict

#Call function with given input
print(countLetters(sys.argv[1]))
