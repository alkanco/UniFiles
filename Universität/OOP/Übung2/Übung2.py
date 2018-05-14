Objektorientierte Programmierung
2. Übungsblatt
Bearbeitet von Simon Pröll, William Djalal

1. Aufgabe

def apply_if(function, arg, list):
    #Create empty list
    finishedList = []
    #Go through list
    for i in range (0, len(list)):
        #If argument of number in list return true
        if arg(list[i]):
            #Add number to function and add result to finishedList
            finishedList.append(function(list[i]))
    #Return finished list
    return finishedList
	
2. Aufgabe

import math

# a)
def zipWith(function, listX, listY, finishedList, step):
    #Return if list is empty
    if (step == (len(listX)) - 1 or step == (len(listY))) - 1:
        #Return finished list
        print(finishedList)
        return
    #Count steps
    step += 1
    #Add result of function with the arguments of both lists to the finished list
    finishedList.append(function(listX[step], listY[step]))
    #Call function from function with new arguments
    zipWith(function, listX, listY, finishedList, step)
    return

# b)
def zipWithEfficient(function, listX, listY):
    resultList = []
    #Check if one or both lists are empty
    if (len(listX) > len(listY)):
        for i in range (0, len(listY)):
            #Add result of function with arguments to the result list
            resultList.append(function(listX[i], listY[i]))
    else:
        for i in range (0, len(listX)):
            #Add result of function with arguments to the result list
            resultList.append(function(listX[i], listY[i]))

    #Return result
    return resultList

zipWith(math.fmod, [1,2,3], [4,5,6], [], -1)
print(zipWithEfficient(math.fmod, [1,2,3], [4,5,6]))

3. Aufgabe

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

4. Aufgabe

import random

def double_birthday():
    birthdays = {}
    for i in range(1, 366):
        #Create random Month
        randMonth = random.randint(1, 12)
        #If month is odd
        if randMonth == 1 or 3 or 5 or 7 or 8 or 10 or 12:
            #Create random day from 1 to 31
            randDay = randint(1, 32)
            #If the the day and month were already created return counter
            if (randDay, randMonth) in birthdays:
                return i
            else:
                birthdays[(randDay, randMonth)] = True
        #If month is february
        elif randMonth == 2:
            #Create random day from 1 to 28
            randDay = random.randint(1, 29)
            #If the the day and month were already created return counter
            if (randDay, randMonth) in birthdays:
                return i
            else:
                birthdays[(randDay, randMonth)] = True
        else:
            #Create random day from 1 to 30
            randDay = random.randint(1, 31)
            #If the the day and month were already created return counter
            if (randDay, randMonth) in birthdays:
                return i
            else:
                birthdays[(randDay, randMonth)] = True

def repeat_double_birthday():
    birthdays = []
    for i in range(0, 365):
        birthdays.append(double_birthday())
    return(birthdays)