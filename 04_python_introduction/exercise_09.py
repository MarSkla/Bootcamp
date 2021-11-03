print('\nexercise_09.py:\n\tuse nested loops to build function printing:',
      '*', '* $', '* $ *', '* $ * $', '* $ * $ *', '* $ * $', '* $ *', '* $',
      '*', sep='\n\t')
print()  # empty line for better readability

print('result:\n')

def arrow(size):
    lst = ''
    half_size = (size // 2)
    # print(f'half_size: {half_size}')
    counter = 0
    downsizer = -2
    while counter < size:
        for num in range(1, half_size + 1):
            if num % 2 == 1:
                lst += '*'
            else:
                lst += '$'
            print(f'line {counter}: {lst}')
            counter += 1
            lst += ' '
        for num2 in range(half_size, size):
            # print(f'num2: {num2}, downsizer: {downsizer}')
            print(f'line {counter}: {lst[:downsizer]}')
            counter += 1
            downsizer -= 2

arrow(10)
