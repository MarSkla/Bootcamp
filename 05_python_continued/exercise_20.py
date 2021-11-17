print("\nexercise_20.py:\n\tBuild Class 'Vector' accepting two arguments "
      "being Cartesian coordinates and calculate length of the vector",
      end="\n\n")

# aware import should be at top of the file, left here with premeditation
from math import sqrt, pow, hypot


class Vector:

    def __init__(self, point_start, point_end):
        assert isinstance((point_start, point_end), (list, tuple)), \
            "use [list] or (tuple) to provide each coordinate"
        self.start = point_start
        self.end = point_end
        self.move_x = point_end[0] - point_start[0]
        self.move_y = point_end[1] - point_start[1]
        self.sqrt = sqrt

    def length(self):
        vector_len = self.sqrt(pow(self.move_x, 2) + pow(self.move_y, 2))
        print("Vector length: ", vector_len)

    def length_aut(self):
        result = hypot((self.move_x),(self.move_y))
        print("Vector length (math.hypo): ", result)

test = Vector((3, 4), (-6, 7))
#
# test.length()
#
# test.length_aut()

print("Equal?  ", (test.length() == test.length_aut()))