print('\nexercise_14.py:\n\tBuild a function taking two arguments and '
      'returning power of 1st argument(base) to 2nd argument (exponent). '
      'Use recursion', end='\n\n')

def my_power(x, y):
    if y == 0:
        return 1
    else:
        return x * my_power(x, y - 1)