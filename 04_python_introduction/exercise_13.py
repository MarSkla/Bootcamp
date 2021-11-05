print('\nexercise_13.py:\n\tBuild a function that takes dictionary mapping '
      'names with height as an argument and returns a list of names sorted '
      'by height in descending order.', end='\n\n')

test_dict = {'John': 185, 'Emma': 167, 'Chewbacca': 260, 'Cristal': 173,
             'Giovanni': 179}


def dict_sort(dictionary):
    result = sorted(dictionary, key=dictionary.get, reverse=True)
    return result

# print(dict_sort(test_dict))
