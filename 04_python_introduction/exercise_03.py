print('\nexercise_03.py:\n\tsort list elements in descending order')
# Python has standard sorted() function and .sort() method (lists only)
# however I do intend to build my own function with same result as sorted()
# sorting in order set by ASCII table

print()  # empty line for better readability


def sorting(lst):
    for first_index in range(len(lst)):
        for second_index in range(first_index):
            if lst[second_index] > lst[first_index]:
                lst[first_index], lst[second_index] = lst[second_index], \
                                                      lst[first_index]
    return lst


test_case = [[1, 3, 0, 2, 4, 5], ['c', 'e', 'g', 'a', 'f'], ['c', 'E', 'g',
                                                             'A', 'F']]
test_no = 1

for case_lst in test_case:
    print(f'test no. {test_no} for list:\n\t {case_lst}')
    print('result:\n\t', sorting(case_lst), '\n')
    test_no += 1
