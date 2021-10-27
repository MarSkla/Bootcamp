print('\nexercise_02.py:\n\tprint all prime numbers lower then given argument')


def prime_numbers(num):
    if not isinstance(num, int):
        print('try with integer')
    elif num <= 0:
        print('try with positive number')
    elif num == 1:
        print(f'{num} is not a prime number')
    else:
        for x in range(2, num):
            for y in range(2, x):
                if x % y == 0:
                    break
            else:
                print(x)


prime_numbers(17)
