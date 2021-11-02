print('\nexercise_04.py:\n\tbuild a function that returns which birthdays '
      'will be celebrated this year by those born in years provided in list '
      'being entry argument for that function')
print()  # empty line for better readability

from datetime import datetime  # import left here with full premeditation

current_year = datetime.today().year


def anniversary(lst, check_date=current_year):
    for element in lst:
        print(f'Check for person born in {element}:')
        anniversary_years = check_date - element
        ending_dict = {1: 'st', 2: 'nd', 3: 'rd', 4: 'th'}
        for key in ending_dict.keys():
            if key == anniversary_years:
                print(f'\tThis person is going to celebrate '
                      f'{anniversary_years}{ending_dict[key]} anniversary')
                break
            elif anniversary_years > 4:
                print(f'\tThis person is going to celebrate '
                      f'{anniversary_years}{ending_dict[4]} anniversary')
                break
            elif anniversary_years == 0:
                print(f'\t First birthday will be celebrated next year')
                break
        else:
            print(f'\tError - The person reported to be born in {element}'
                  f' has not been born yet')


lst_a = [2020, 2019, 2018, 2017, 1993, 1970, 2013, 2032, 2021]
anniversary(lst_a, 2019)
