print('\nexercise_15.py:\n\tBuild a function taking single list as an '
      'argument and returns the item appearing most often in the list',
      end='\n\n')

from random import randint  # left here with premeditation

test_lst = [randint(1, 5) for x in range(20)]


def most_frequent(lst):
    temp_dict = {k: lst.count(k) for k in lst}
    sorted_temp_dict = sorted(temp_dict.items(), key=lambda x: x[1],
                              reverse=True)
    return sorted_temp_dict[0][0]


print(f'List to test: {test_lst}\n')
print(f'The most frequent item in the list is: "{most_frequent(test_lst)}"')
print(f'It appears {test_lst.count(most_frequent(test_lst))} times')
