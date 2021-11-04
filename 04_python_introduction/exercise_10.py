print('\nexercise_10.py:\n\tbuild a function that accepts two lists of '
      'integers and returns a list of the numbers in the first list and not '
      'in the second one, sorted in ascending order based on number of '
      'occurrences in the first list')
print()  # empty line for better readability

import random

lst_a = [random.randint(0, 10) for lst_a_item in range(30)]
lst_b = [random.randint(0, 5) for lst_b_item in range(15)]
print(f'lst_a: {lst_a}')
print(f'lst_b: {lst_b}')