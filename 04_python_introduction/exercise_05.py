print('\nexercise_04.py:\n\tbuild a function that returns which birthdays '
      'will be celebrated this year by those born in years provided in a '
      'list being entry argument for that function')

print()  # empty line for better readability


def anniversary(lst):
    current_year = int(input("Provide current year: "))
    for element in lst:
        print(f'Check for person born in {element}:')
        if current_year >= element:
            print(f'\tThis person is going to celebrate '
                  f'{current_year - element} anniversary')
        else:
            print(f'\tError - The person reported to be born in {element} has '
                  f'not been born yet')


lst_a = [1993, 1970, 2013, 2032]
anniversary(lst_a)