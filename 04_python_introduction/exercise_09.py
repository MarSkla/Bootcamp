print('\nexercise_09.py:\n\tuse nested loops to build function printing ('
      'arrow width = 5):',
      '*', '* $', '* $ *', '* $ * $', '* $ * $ *', '* $ * $', '* $ *', '* $',
      '*', sep='\n\t')
print()  # empty line for better readability


print('result:\n')


def arrow(size):
    lst = '\t'
    counter = 0
    downsizer = -2
    while counter < size:
        for num in range(1, size + 1):
            if num % 2 == 1:
                lst += '*'
            else:
                lst += '$'
            print(lst)
            counter += 1
            lst += ' '
        for num2 in range(size + 1, size * 2):
            print(lst[:downsizer])
            counter += 1
            downsizer -= 2


arrow(int(input('Arrow width: ')))
