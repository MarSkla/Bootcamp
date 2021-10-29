print('\nexercise_04.py:\n\tbuild a function that returns a list of unique '
      'values from two other lists')
# In spite of possibility to use standard Python solutions like "&"
# operator for lists converted thanks to set(), I will use loop to practice

print()  # empty line for better readability


def unique_vls(lst_a, lst_b):
    temp_lst = [lst_a, lst_b]
    unique_lst = []
    for lst in temp_lst:
        lst_index = temp_lst.index(lst)
        other_lst = temp_lst[len(temp_lst) - lst_index - 1]
        for element in lst:
            if element not in other_lst:
                unique_lst.append(element)
    return unique_lst


a = [1, 2, 3, 'a', 'c']
b = ['a', 'b', 'c', 'd', 4]

print(unique_vls(a, b))
