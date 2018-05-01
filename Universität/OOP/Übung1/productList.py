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
