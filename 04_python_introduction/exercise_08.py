print('\nexercise_08.py:\n\tbuild function that check if two strings being '
      'its arguments are palindromes')
print()  # empty line for better readability

test_string_1 = 'te$st te/st,'
test_string_2 = '#Tset ts^!eT'

print(f'Test for:\n\tstring no.1: "{test_string_1}"\n\tstring no.2: "'
      f'{test_string_2}"\n')

def palindromes(string_1, string_2):
    assert isinstance(string_1, str) and isinstance(string_2, str), \
        'both arguments have to be strings'
    arrays_lst = [string_1.lower(), string_2.lower()]
    for element in arrays_lst:
        arrays_lst[arrays_lst.index(element)] = ''.join(char for char in
                                                        element if
                                                        char.isalnum())
    if arrays_lst[0][::-1] == arrays_lst[1]:
        print('They are palindromes')
    else:
        print('They are not palindromes')


palindromes(test_string_1, test_string_2)
