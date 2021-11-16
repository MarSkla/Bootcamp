print("\nexercise_19.py:\n\tBuild Class 'Figure' with two methods for "
      "calculation of area and perimeter. Create subclasses representing "
      "triangle and rectangle implementing appropriate method", end="\n\n")


class Figure:

    def __init__(self, values):
        assert isinstance(values, (list, tuple))

        self.values = values
        self.height = self.values[1]
        self.base = self.values[0]

        self.area = 0
        self.perimeter = 0

    def area(self):
        return NoteImplemented

    def perimeter(self):
        self.perimeter = sum(self.values)


class Rectangle(Figure):

    def __init__(self, values):
        super().__init__(values)


    def area(self):
        self.area = self.base * self.height


class Triangle(Figure):

    def __init__(self, values):
        super().__init__(values)


    def area(self):
        self.area = self.base * self.height / 2


fig_1 = Rectangle((2, 4))




