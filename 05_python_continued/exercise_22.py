print("\nexercise_22.py:\n\tBuild abstract base class Animal. Constructor is "
      "going to accept an argument representing name of an animal. Class must "
      "have 2 methods: 1st 'sound' is going to be abstract. Second 'greeting' "
      "has to print string build as value returned by 'sound' extended by "
      "name of the animal and type of the animal.", end="\n\n")


from abc import ABC, abstractmethod  # left here with premeditation


class Animal(ABC):

    def __init__(self, name):
        self.name = name

    @abstractmethod
    def sound(self):
        pass

    def greeting(self):
        print(f'{self.sound()}! My name is {self.name} and I\'m a '
              f'{self.animal_type}.')


class Dog(Animal):

    animal_type = 'dog'

    def sound(self):
        return 'Woof'


class Cat(Animal):

    animal_type = 'cat'

    def sound(self):
        return 'Meow'


class Horse(Animal):

    animal_type = 'horse'

    def sound(self):
        return 'Neigh'


tequila = Dog('Tequila')

tequila.greeting()
