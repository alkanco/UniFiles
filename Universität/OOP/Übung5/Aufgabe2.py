<<<<<<< Updated upstream
"""Der beste Weg wäre der radix-sort. Dieser benötigt trotz
1 million integers nur 10 buckets für das Dezimalsystem und
funktioniert daher weiterhin mit linearem Aufwand. Dadurch
ist er sogar wesentlich schneller als zum Beispiel der
Quick-sort bzw. Merge-sort."""

import random
import sys

testList = []

def radixsort(list):
    #Decimal
    RADIX = 10
    maxLength = False
    tmp, placement = -1, 1

    while not maxLength:
        maxLength = True
        #Create buckets
        buckets = [[] for _ in range(RADIX)]

        #Split given list
        for i in list:
            tmp = i / placement
            buckets[tmp % RADIX].append(i)
            if maxLength and tmp > 0:
                maxLength = False

        #Empty lists in to list array
        a = 0
        for b in range(RADIX):
            buck = buckets[b]
            for i in buck:
                list[a] = i
                a += 1

        #Next number
        placement *= RADIX

for i in range(1, 1000000):
    testList.append(random.randint(0, sys.maxsize))
print(radixsort(testList))
=======
def counting_sort(A, k):
    size = len(A)
    B = [0 for i in range(0, size)]
    C = [0 for i in range(0, k + 1)]

    #Counting in array c
    for j in range(0, size):
        C[A[j]] += 1
    #Adding the previous number to next number in array c
    for i in range(1, k + 1):
        C[i] += C[i - 1]
    for j in range(size - 1, -1, -1):
        C[A[j]] -= 1
        B[C[A[j]]] = A[j]
    return B
>>>>>>> Stashed changes
