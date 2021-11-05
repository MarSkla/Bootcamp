print('\nexercise_12.py:\n\tBuild a function that takes two arguments (name, '
      'height) and on that basis creates new entry into global dictionary. '
      'Add 5 entries at least.', end='\n\n')

global_dict = {}

def standard_entry(name, height):
    global_dict[name] = height

standard_entry('John', 185)
standard_entry('Emma', 167)
standard_entry('Chewbacca', 260)
standard_entry('Cristal', 173)
standard_entry('Giovanni', 179)

print(global_dict)

