print("\nexercise_19.py:\n\tBuild Class 'Figure' with two methods for "
      "calculation of area and perimeter. Create subclasses representing "
      "triangle and rectangle implementing appropriate method", end="\n\n")


class Figure:

    def __init__(self, values):
        assert isinstance(values, (list, tuple))
        self.values = values
        self.height = self.values[0]
        self.base = self.values[1]

        # self.area = 0
        # self.perimeter = 0

    def area(self):
        return NoteImplemented

    def perimeter(self):
        self.perimeter = sum(self.values)
        print("Perimeter of the figure is: ", self.perimeter)


class Rectangle(Figure):

    def __init__(self, values):
        super().__init__(values)
    # not necessary but more effective - only method called not entire class1

    def area(self):
        self.area = self.base * self.height
        print("Area of the fig is: ", self.area)


class Triangle(Figure):

    def __init__(self, values):
        super().__init__(values)
    # not necessary but more effective - only method called not entire class

    def area(self):
        self.area = self.base * self.height / 2
        print("Area of the fig is: ", self.area)

    def perimeter(self):
        self.perimeter = sum(self.values[1:])
        print("Triangle perimeter is :", self.perimeter)


fig_1 = Rectangle((2, 4))
fig_2 = Triangle((1.5, 4, 2, 5))

fig_1.perimeter()
fig_1.area()

fig_2.perimeter()
fig_2.area()
