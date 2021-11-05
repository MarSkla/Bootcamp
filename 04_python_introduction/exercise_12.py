print('\nexercise_12.py:\n\tBuild a function that takes two arguments (name, '
      'height) and on that basis creates new entry into global dictionary. '
      'Add 5 entries at least.', end='\n\n')

global_dict = {}
global_dict_2 = {}


def standard_entry(name_txt, height):
    global_dict[name_txt] = height


def better_entry():
    num_of_entries = int(input('How many entries would you like to add? : '))
    for num in range(num_of_entries):
        name_txt = input(f'Provide name no. {num + 1}: ').title()
        height = int(input(f'Provide height no. {num + 1}: '))
        global_dict_2[name_txt] = height


standard_entry('John', 185)
standard_entry('Emma', 167)
standard_entry('Chewbacca', 260)
standard_entry('Cristal', 173)
standard_entry('Giovanni', 179)

better_entry()

print('\nGlobal dictionary for "standard_entry(name, height)"',
      *global_dict.items(), sep='\n\t')
print('\nGlobal dictionary for "better_entry()"',
      *global_dict_2.items(), sep='\n\t')
