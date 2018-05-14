import random
import sys

def calcRepeat(lowestNum, highestNum):
    dictNum = {}
    counter = 0
    #Create random number
    currNumber = random.randint(lowestNum, highestNum + 1)
    #While the random number is not already in the dictionary
    while currNumber not in dictNum:
        #Write number in dictionary
        dictNum[currNumber] = True
        #Count this cycle
        counter += 1
        currNumber = random.randint(lowestNum, highestNum + 1)
    #Return count of cycles
    return counter

print(calcRepeat(0, 10))
