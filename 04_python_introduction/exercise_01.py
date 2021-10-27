def divisible(x, y):
    try:
        if x > 0:
            if x % y == 0:
                print(f'\'{x}\' jest podzielne przez \'{y}\'')
            else:
                print(f'\'{x}\' nie jest podzielne przez \'{y}\'')
        else:
            print(f'\'0\' podzielone przez jakąkolwiek liczbę dalej będzie zerem')
    except ZeroDivisionError as zde:
        print(f'Error: {zde}')


divisible(0, 5)

divisible(7, 5)

divisible(10, 2)

