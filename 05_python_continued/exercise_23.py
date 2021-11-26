print("\nexercise_22.py:\n\tBuild base class Animal and two subclasses 'Dog' "
      "and 'Cat'. Dog&Cat Constructors must consist a variable describing type "
      "of an animal. Dog & Cat classes must consist make_sound method. Check "
      "whether instances of Dog & Cat classes will return proper greeting "
      "message.", end="\n\n")


class Animal:  
    
    def __init__(self):
        pass

    def greeting(self):
        print(f'I\'m a {self.animal_type}. {self.make_sound()}')


class Dog(Animal):

    def __init__(self, animal_sound):
        super().__init__()
        self.animal_type = animal_sound

    @staticmethod
    def make_sound():
        return 'Woof!'


class Cat(Animal):

    def __init__(self, animal_sound):
        super().__init__()
        self.animal_type = animal_sound

    @staticmethod
    def make_sound():
        return 'Meow....'


tequila = Dog('dog')
tequila.greeting()
print()

gin = Cat('cat')
gin.greeting()
