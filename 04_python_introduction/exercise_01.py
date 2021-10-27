print('\nexercise_01.py:\n\tchecks whether "x" is divisible by "y"')


def divisible(x, y):
    try:
        if x > 0:
            if x % y == 0:
                print(f'\t\'{x}\' jest podzielne przez \'{y}\'')
            else:
                print(f'\t\'{x}\' nie jest podzielne przez \'{y}\'')
        else:
            print(f'\t\'0\' podzielone przez jakąkolwiek liczbę dalej będzie zerem')
        print('all good, script completed')
    except ZeroDivisionError as zde:
        print(f'Error: {zde}\n\tscript completed')


# below prints are only to assure clarity when file run in terminal
print('\ntest for "divisible(0, 5)"')
divisible(0, 5)

print('\ntest for "divisible(7, 5)"')
divisible(7, 5)

print('\ntest for "divisible(10, 2)"')
divisible(10, 2)

print('\ntest for "divisible(4, 0)"')
divisible(4, 0)
