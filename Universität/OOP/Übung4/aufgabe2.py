import sys
import random

def is_sorted(list):
    gettingHigher = False
    gettingLower = False
    for i in range (1, len(list) - 1):
        if list[i-1] < list[i] < list[i+1]:
            gettingHigher = True
        elif list[i-1] > list[i] > list[i+1]:
            gettingLower = True
            gettingHigher = False
        else:
            return 0
    if gettingHigher == True:
        return 1
    else:
        return -1

def gen_randlist(a, b, n):
    finishedList = []
    #Length of list is n
    for i in range (1, n):
        #Add random number between a and b to "finishedList"
        finishedList.append(random.randint(a, b+1))
    return finishedList
