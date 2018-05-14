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

"""
def birthday_paradox(n=25):
    blist = repeat_double_birthday(n)

    def bcount(blist=[], n=0):
        count = 0
        for i in range(1, n+2):
            if blist != []:
                if n > blist[0]:
                    count = count + 1
                    del blist[0]
                else:
                    del blist[0]
            else:
                break
        return(count)
    bdiv = bcount(blist, n)
    p = ((bdiv)*100/n)
    return(p)
"""
