print('\nexercise_10.py:\n\tbuild a function that accepts two lists of '
      'integers and returns a list of the numbers in the first list and not '
      'in the second one, sorted in ascending order based on number of '
      'occurrences in the first list')
print(f'\nINFO: \n{"-" * 10}\n both lists are randomly generated with '
      'following assumptions to assure unique elements in First list:'
      '\n\tFirst list: 20 elements from range (0,10)'
      '\n\tSecond list: 10 elements from range (0,5)'
      f'\n{"-" * 10}\n')

import random  # left here with premeditation; should be at the top

lst_a = [random.randint(0, 10) for lst_a_item in range(20)]
lst_b = [random.randint(0, 5) for lst_b_item in range(10)]
print(f'Test case:\n\tFirst list: \t{lst_a}\n\tSecond list: \t{lst_b}')


def sorted_unique(lst_1, lst_2):
    temp_list = [num for num in lst_1 if num not in lst_2]
    temp_dict = {k: temp_list.count(k) for k in temp_list}
    sorted_dict = dict(sorted(temp_dict.items()))  # final list ascending

    print(f'\nReturned list: {sorted(sorted_dict, key=sorted_dict.get)}')

    check_info = input('\nWould you like to check? (y/n): ')

    if check_info == 'y':
        for num in sorted(sorted_dict, key=sorted_dict.get):
            print(f'\tNum {num} occurs {sorted_dict[num]} time(s) in First '
                  f'list')


sorted_unique(lst_a, lst_b)
