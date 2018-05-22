import sys
import random

# a)
def initilizeMatrix(n, m):
    #Create a 2d array with n rows and m columns
    return [[0] * m] * n

# b)
def printSpielFeld(matrix):
    #Print every row of the matrix
    for row in matrix:
        print(row)

# c)
def newSpiel(p, matrix):
    #Go through every row in matrix
    for row, val in enumerate(matrix):
        #Go through every position in row
        for number, val2 in enumerate(val):
            #Check for the possibility p
            if random.randint(0, p + 1) == 0:
                #Create hole at position
                matrix[row][number] = 'O'
            else:
                #Create no hole at position
                matrix[row][number] = '.'
        print(val)

# d)
"""
def generateSolution(matrix2):
    for row in matrix2:
        for number in row:
            if number == '.':
                if number - 1 == 'O':
"""




print(newSpiel(sys.argv[1], initilizeMatrix(sys.argv[2], sys.argv[3])))
