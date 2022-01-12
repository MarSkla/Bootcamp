# print('\nexercise_03.py:\n\tsort list elements in descending order')
# # Python has standard sorted() function and .sort() method (lists only)
# # however I do intend to build my own function with same result as sorted()
# # sorting in order set by ASCII table
#
# print()  # empty line for better readability
#
#
# def sorting(lst, direction='asc'):
#     for first_index in range(len(lst)):
#         for second_index in range(first_index):
#             if direction == 'asc':
#                 if lst[second_index] > lst[first_index]:
#                     lst[first_index], lst[second_index] = lst[second_index], \
#                                                           lst[first_index]
#             if direction == 'dsc':
#                 if lst[second_index] < lst[first_index]:
#                     lst[first_index], lst[second_index] = lst[second_index], \
#                                                           lst[first_index]
#     return lst
#
#
# test_case = [[[1, 3, -4, 2, 4, 5]], [['c', 'e', 'g', 'a', 'f']],
#              [['c', 'E', 'g', 'A', 'F']], [[1, 3, -4, 2, 4, 5], 'dsc'],
#              [['c', 'e', 'g', 'a', 'f'], 'dsc'], [['c', 'E', 'g', 'A', 'F'],
#                                                   'dsc']]
#
# test_no = 1
#
# for case_lst in test_case:
#     if len(case_lst) == 1:
#         print(f'test no. {test_no} for list:\n\t {case_lst}')
#         print('result:\n\t', sorting(case_lst), '\n')
#         test_no += 1
#     elif len(case_lst) == 2:
#         print(f'test no. {test_no} for list:\n\t {case_lst}')
#         print('result:\n\t', sorting(case_lst[0], case_lst[1]), '\n')
#         test_no += 1

testArray = [7, 1, 8, 0, 8, 2, 9, 4]

for (i=0; i)
