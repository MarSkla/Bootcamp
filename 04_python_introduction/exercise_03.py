print('\nexercise_03.py:\n\tsort list elements in descending order')
# Python has standard sorted() function and .sort() method (lists only)
# however I will try to build my own function with same result as sorted()
print()  # empty line for better readability


def sorting(lst):
    print(lst)
    for idx in range(1, len(lst)):
        for idx_next in range(idx - 1):
            # print('idx: ', idx, 'type: ', type(idx))
            # print('lst[idx - 1]: ', lst[idx - 1], 'type: ', type(lst[idx + 1]))
            # print('lst[idx]: ', lst[idx], 'type: ', type(lst[idx]))
            if lst[idx] < lst[idx - 1]:
                lst[idx], lst[idx_next] = lst[idx_next], lst[idx]
    print('lst sorted?: ', lst)


x = [1, 3, 0, 2, 4, 5]

sorting(x)
