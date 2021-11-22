print("\nexercise_21.py:\n\tBuild Class 'Polygon' where constructor "
      "ask for coordinates of vector (start + end point) being sides "
      "of a polygon. 'Polygon' Class should check if the input is "
      "correct, i.e. start point of the next side is the same as end "
      "point of the previous input. 'Polygon' Class should also include "
      "method to calculate perimeter of the polygon", end="\n\n")

from math import hypot


class Polygon:

    def __init__(self):
        self.coordinates = []
        self.sides_num = int(input("How many sides your polygon will have? : "))
        if self.sides_num > 2:
            while len(self.coordinates) < 3:
                self.vector = input("Provide coordinates (a1,b1,a2,b2): ")
                if self.vector.count(",") == 3:
                    self.vector = [int(x) for x in self.vector.split(",")]
                    self.coordinates.append(self.vector)
                else:
                    print("Provide all 4 coordinates (a1,b1,a2,b2)!")
        else:
            print("At least 3 sides are needed to create a polygon")

    def vectors_lengths(self):
        vector_len = []
        for el in self.coordinates:
            result = hypot((el[2] - el[0]), (el[3] - el[1]))
            vector_len.append(round(result, 2))
        return vector_len

    def perimeter_cal(self):
        perimeter = self.vectors_lengths()
        print("Perimeter: ", sum(perimeter))


figure = Polygon()

# figure.print_in()

print("Vectors lengths are: ", *figure.vectors_lengths(), sep="\n\t")

figure.perimeter_cal()

