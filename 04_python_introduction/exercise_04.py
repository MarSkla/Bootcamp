print('\nexercise_04.py:\n\tbuild a function that returns a list of unique '
      'values from two other lists')
# In spite of possibility to use standard Python solutions like "&"
# operator for lists converted thanks to set(), I will use loop to practice

print()  # empty line for better readability

def unique_vals(lst_a, lst_b):
      temp_lst = [lst_a, lst_b]
      print(temp_lst)
      unique_lst = []
      for element in lst_a:
            if element

a = [1, 2, 3, 'a', 'c']
b = ['a', 'b', 'c', 'd', 4]

# print(a + b)
unique_vals(a, b)
