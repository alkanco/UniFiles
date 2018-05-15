import sys

def countLetters (list):
    #Create Dictionary
    countDict = {}
    #Go through given list
    for i in range (0, len(list)):
        #If element already is in dictionary, count + 1
        if list[i] in countDict:
            countDict[list[i]] += 1
        else:
            countDict[list[i]] = 1
    #Return finished dictionary
    return countDict

print (countLetters(sys.argv[1]))
