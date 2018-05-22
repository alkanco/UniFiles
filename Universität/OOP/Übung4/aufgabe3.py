import random
import statistics

# b)
def quicksort (A, low, high):
    if low < high:
        m = partition (A, low, high)
        quicksort (A, low, m - 1)
        quicksort (A, m + 1, high)

def partition (A, low, high):
    pivotList = []
    pivotList.append (random.randint(low, high + 1))
    pivotList.append (random.randint(low, high + 1))
    pivotList.append (random.randint(low, high + 1))
    pivot = statistics.median (pivotList)
    i = low
    for j in range (low + 1, high + 1):
        if (A[j] < pivot):
            i = i + 1
            A[i], A[j] = A[j], A[i]
    A[i], A[low] = A[low], A[i]
    return i

# f)
def insertsort (seq):
    for j in range (1, len(seq)):
        key = seq[j]
        k = j - 1
        while k >= 0 and seq[k] > key:
            seq[k + 1] = seq[k]
            k = k - 1
        seq[k + 1] = key
        return seq

def quick_insert (A, low, high, k):
    if low < high:
        m = partition (A, low, high)
        #If any subarray is smaller than k, use insertsort function
        if (low + (m - 1)) < k:
            insertsort (A)
        else:
            quicksort (A, low, m - 1)
        if (high - (m + 1)) < k:
            insertsort (A)
        else:
            quicksort (A, m + 1, high)
