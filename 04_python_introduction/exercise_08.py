print('\nexercise_08.py:\n\tbuild function that check if two strings being '
      'its arguments are palindromes')
print()  # empty line for better readability


def palindromes(array_1, array_2):
    assert isinstance(array_1, str) and isinstance(array_2, str), \
        'both arguments have to be strings'
    if array_1.lower()[::-1] == array_2.lower():
        print('They are palindromes')
    else:
        print('They are not palindromes')


palindromes('test', 'Tset')
