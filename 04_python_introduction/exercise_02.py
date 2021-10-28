print('\nexercise_02.py:\n\tprint all prime numbers lower then argument given')
print()  # empty line for better readability


def prime_numbers(num):
    print(f'check for "prime_numbers({num})"')
    try:
        if isinstance(num, float):
            num = int(num//1)
        isinstance(num, int)
        if num <= 1:
            print('\ttry with positive number larger than 1')
        for x in range(2, num):
            for y in range(2, x):
                if x % y == 0:
                    break
            else:
                print(f'\t{x}')
    except TypeError:
        print(f'\tError: wrong function argument type - use "int" or "float"')
    finally:
        print('\n\tscript end\n')

prime_numbers(20)

prime_numbers(-3)

prime_numbers(0)

prime_numbers(7.5)

prime_numbers('a')
