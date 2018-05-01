import sys

#Get input from user in number
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

#Print out result
print (findDividor(sys.argv[1]))
