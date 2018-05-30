# a)
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
