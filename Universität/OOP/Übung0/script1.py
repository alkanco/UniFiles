import math
import sys

#Calculate area
def area (s, n, a):
    area = (int(n) * int(s) * int(a))/2
    return (area)

#Calculate var a
def apothema(s, n):
    a = int(s) / (2 * math.tan(math.pi / int(n)))
    return(a)

#Check if input is negative
if (int(sys.argv[1]) > -1 and int(sys.argv[2]) > -1):
    #Start both area und apothema functions
    print (area(sys.argv[1], sys.argv[2], apothema(sys.argv[1], sys.argv[2])))
