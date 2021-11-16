print('\nexercise_17.py:\n\tBuild Class "Triangle" (accepting 3 arguments being'
      'triangle angles) that  implement "check_angles" method adding all '
      'arguments and returning info whether arguments sums to triangle or not ',
      end='\n\n')

class Triangle():

    def __init__(self, ang_1, ang_2, ang_3):
        self.ang_1 = ang_1
        self.ang_2 = ang_2
        self.ang_3 = ang_3

    def check_angles(self):
        result = self.ang_1 + self.ang_2 + self.ang_3
        start_statement = "Sum of all angles equals to: "
        answer = ''
        if result == 180:
            answer = "They may constitute triangle"
        else:
            answer = "These tree angles will not create triangle"
        print(start_statement, result)
        print(answer)

triangle1 = Triangle(15, 45, 100)

triangle1.check_angles()
