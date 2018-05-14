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
