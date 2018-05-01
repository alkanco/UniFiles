import sys

def findDividor (number):
    #Transform number from string to int
    number = int(number)
    dividorList = []
    #Go through every number until number-1
    for i in range(1, (number) - 1):
        #Don't add the number 0 to the list
        if (number % i == 0):
            #Add number to the list
            dividorList.append(i)
    #Return final list
    return dividorList

def findPair(m, n):
    #Convert string input to int
    m = int(m)
    n = int(n)
    #Calculate the sum of all dividors of m
    sumM = 0;
    for i in range(0, len(findDividor(m))):
        sumM = sumM + (findDividor(m))[i]
    #Calculate the sum of all dividors of n
    sumN = 0;
    for i in range(0, len(findDividor(n))):
        sumN = sumN + (findDividor(n))[i]
    #Check if both m & n are equal to the sum of the other number
    if (sumM == n and sumN == m):
        return(True)
    else:
        return(False)

#Print final result
print (findPair(sys.argv[1], sys.argv[2]))
