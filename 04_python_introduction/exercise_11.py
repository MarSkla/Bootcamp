print('\nexercise_11.py:\n\tCreate a function that accepts "n" argument and '
      'returns value of "n-th" Fibonacci number.', end='\n\n')

fibo_num = int(input('Which number do you want to know? : '))
# print(f' fibo_num input: {fibo_num}, type: {type(fibo_num)}')

def fib(n):
    # if n in (0, 1):
    #     return n
    # else:
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
    # elif num > 50:
    #     answer = input('Recursion method will significantly consume RAM and '
    #                    'request more time without success guarantee.\nDo you '
    #                    'want to continue? (y/n):')
    #     if answer == 'y':
    #         print(f'Your Fibonacci number (recursion) is: {fib(num)}')
    #         print(f'Your Fibonacci number (iteration) is: {fib_2(num)}')
    #     else:
    #         print(f'Your Fibonacci number (iteration) is: {fib_2(num)}')
    # elif num >= 2:
    else:
        print('num :', num, 'type(num): ', type(num))
        print(f'Your Fibonacci number (recursion) is: {fib(fibo_num)}')
        print(f'Your Fibonacci number (iteration) is: {fib_2(fibo_num)}')


test_value(fibo_num)

# if fibo_num < 0:
#     fibo_num = int(input('Natural number needed: '))
# if fibo_num in (0, 1):
#     print(f'Result: {fibo_num}')
#     # fib(fibo_num)
#     # fib_2(fibo_num)
# else:
#     pass

#
# print(f'Result(recursion): {fib(fibo_num)}')
# print(f'Result(iteration): {fib_2(fibo_num)}')
