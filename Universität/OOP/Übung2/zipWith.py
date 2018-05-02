finishedList = []
step = 0

def zipWith(function, listX, listY):
    #Return if list is empty
    if (step > len(listX) or step > len(listY)):
        #Return finished list
        return(global finishedList)
    #Count steps
    step += 1
    #Add result of function with the arguments of both lists to the finished list
    global finishedList.append(function(listX[global step], listY[global step]))
    #Call function from function with new arguments
    zipWith(function, listX[global step], listY[global step])
