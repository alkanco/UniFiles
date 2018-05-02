def apply_if(function, arg, list):
    #Create empty list
    finishedList = []
    #Go through list
    for (i in range (0, len(list))):
        #If argument of number in list return true
        if (arg(list[i])):
            #Add number to function and add result to finishedList
            finishedList.append(function(list[i]))
    #Return finished list
    return(finishedList)
