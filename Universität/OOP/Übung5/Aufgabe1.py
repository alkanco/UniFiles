def is_max_heap(list):
    if list[1] < list[0] or list[2] < list[0]:
        return False
    else:
        return True
