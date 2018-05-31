#Objektorientierte Programmierung
#5. Übungsblatt
#Bearbeitet von: Simon Pröll, William Djalal

# 1. Aufgabe
def counting_sort(A, k):
    size = len(A)
    counter = 0
    #Add size to list c
    C = [0 for i in range(0, (k+1) + size)]

    for j in range(0, size):
        C[A[j]] += 1
    for i in range(1, k+1):
        C[i] += C[i-1]
    for j in range(size-1, -1, -1):
        C[A[j]] -= 1
        #Add finished b result to list c after length k
        C[C[A[j]] + k] = A[j]
    #Go through second part of list c
    for z in C[k+2:]:
        #Set first part of list c to sorted numbers
        C[counter] = z
        counter += 1
    return C

# 2. Aufgabe
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

# 3. Aufgabe
{P} ≡ {a > 0 ∧ b > 0 ∧ c < 0}

a = a + b - c

{a > 0 ∧ b > 0}

d = b

{a > 0 ∧ b > 0}

b = a - b - c

{a > 0 ∧ b > 0 ∧ b == a − d + c}

c = - c

{Q} ≡ {a > 0 ∧ b > 0 ∧ c > 0 ∧ b == a − d + c}

# 4. Aufgabe
{P und x%2==0}
y=y+y   {2*y}
x=x//2  {x/2}
{Q}

x/2 * 2*y + z == x * y + z

x * 2 * y + z
---------
2 * 1 * 1

x * y + z
-----
  1

x * y + z == x * y + z


{P und nicht x%2==0}
z = z + y   {z + y}
x = x - 1   {x - 1}
{Q}

(x - 1) * y + (z + y) = x * y + z
(x*y) - (y*1) + z + y = x * y + z
x * y - y + z + y = x * y + z
x * y + z + y - y = x * y + z
x * y + z = x * y + z
