print('\nexercise_16.py:\n\tBuild Class Diary and implement methods to '
      'read and write content which will be stored in txt file.',
      end='\n\n')


class Diary:

    def __init__(self, file):
        self.file = file

    def check(self):
        print('Provide file name:\t\t', self.file)

    def add_text(self):
        with open(self.file, 'at') as d:
            d.write(input('Please share your thoughts:'))
            d.write('\n')


    def read_diary(self):
        a = open(self.file, 'r')
        print(a.read())
