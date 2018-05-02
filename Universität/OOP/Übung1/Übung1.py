Objektorientierte Programmierung
1. Übungsblatt
Bearbeitet von Simon Pröll, William Djalal

1. Aufgabe

import sys

#Function takes list from user
def calcProd(argv):
    #Product will save the result of every calculation
    product = 1
    #Split list at every whitespace
    input = argv.split(' ')
    #Go through the whole list and multiply the current number with product
    for i in range(0, len(input)):
        product = product * int(input[i])
    #Return finished result
    return(product)

#Print out result
print (calcProd(sys.argv[1]))

2. Aufgabe

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

3. Aufgabe

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

4. Aufgabe

# Version 0.3 Veranstaltung: Objektorientierte Programmierung
# Author: Prof. Dr. Margarita Esponda

"""	In this homework you have to program the inside of six diferent 'decide_color_..' functions.
        The functions calculate and returns a color for each (x,y) position of a square of side = size.

        The functions are used in the modul'MosaicFrames.py' which shows the diferent pictures (mosaics)
        on a window.

        We wrote some simple examples of decide_color functions
        Please overwrite them with your own solutions.

        The 'MosaicFrames.py' file and this file have to be in the same directory and you must start the programm
        with 'MosaicFrames.py'.
"""

def decide_color_squares(x, y, size):
    if (y > size / 4 and y < size / 2 and x > size / 4 and x < size / 2):
        return 'RED'
    if (y > size / 2 and y < (size - size / 4) and x > size / 2 and x < (size - size / 4)):
        return 'RED'
    return 'BLACK'

def decide_color_diags(x, y, size):
    if ((y * size / 6 - x) % (size / 6 - 1) == 0):
        return 'RED'
    else:
        return 'YELLOW'

def decide_color_triangles(x, y, size):
    if (x < (size // 2)):
        if (y < (size // 2)):
            return 'BLUE'
        elif (x > (size // 6)) and (x < 2 * (size // 6)) and (y > 4 * (size // 6)) and (y < 5 * (size // 6)):
            if (x + y > 6 * (size // 6)):
                return 'GREEN'
            else:
                return 'ORANGE'
        else:
            return 'BLUE'
    elif (x + y < size):
        return 'GRAY'
    elif (y > x):
        return 'GREEN'
    else:
        return 'WHITE'

def decide_color_circle(x, y, size):
    # overwrite the content of the function
    return 'GRAY'

def decide_color_chess(x, y, size):
    if (((8 * x) // size) % 2 == ((8 * y) // size) % 2):
        return 'BLACK'
    else:
        return 'WHITE'

def decide_color_illusion_1(x, y, size):
    if (x + 6 > size // 3) and (x < (size // 3) * 2) and (y + 6 > size // 3) and (y < (size // 3) * 2):
        return 'MAGENTA'
    elif (((y - 1) // (size // 50)) % (4) == 0) or (((x - 1) // (size // 50)) % (4) == 0):
        return "WHITE"
    else:
        return 'BLACK'

def decide_color_illusion_2(x, y, size):
    # overwrite the content of the function
    return "black"

def decide_color_illusion_3(x, y, size):
    # overwrite the content of the function
    return 'WHITE'

def decide_color_own_picture(x, y, size):
    return 'GRAY'