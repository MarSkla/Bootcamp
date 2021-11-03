print('\nexercise_07.py:\n\tbuild function that count letters and numeric '
      'characters in a given string')
print()  # empty line for better readability

test_phrase = '1klaw$5 ~gr(:t'
print(f'test phrase: {test_phrase}\n')


def count_char(str):
    nums = 0
    letters = 0
    spaces = 0
    others = 0
    for element in str:
        if element.isnumeric():
            nums += 1
        elif element.isalpha():
            letters += 1
        elif element.isspace():
            spaces += 1
        else:
            others += 1

    print(f'string length: {len(str)} \n\tnums: {nums} \n\tletters: {letters}'
          f' \n\tspaces: {spaces} \n\tothers: {others}')


count_char(test_phrase)
