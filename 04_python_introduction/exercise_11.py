print('\nexercise_11.py:\n\tCreate a function that accepts "n" argument and '
      'returns value of "n-th" Fibonacci number.', end='\n\n')


def fib(n):
    if n in (0, 1):
        return n
    else:
        return fib(n-1) + fib(n-2)


def fib_2(n):
    # if n in (0, 1):
    #     return n
    # else:
    a = 0
    b = 1
    for _ in range(2, n):
        a, b = b, (a + b)
    return a + b


def test_value(num):
    if num < 0:
        num = int(input('Natural number needed: '))
        test_value(num)
    elif num in (0, 1):
        print(f'Your Fibonacci number is: {num}')
    else:
        print(f'Your Fibonacci number (recursion) is: {fib(num)}')
        print(f'Your Fibonacci number (iteration) is: {fib_2(num)}')


fibo_num = int(input('Which number do you want to know? : '))

test_value(fibo_num)




