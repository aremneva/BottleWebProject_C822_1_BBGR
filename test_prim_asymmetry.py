import unittest

class Test_test_prim_asymmetry(unittest.TestCase):
    def test_A(self):
        data={"1": [[0, 3, 0], [0, 0, 3], [0, 0, 0]], "2": [[0, 0], [2, 0]], "3": [[0, 4, 0, 6], [0, 0, 0, 0], [0, 0, 0, 3], [6, 0, 3, 0]], "4":[[0, 1, 0], [2, 0, 0], [0, 2, 0]],"5": [[0, 0, 2, 0], [0, 0, 0, 0], [5, 0, 0, 1], [0, 0, 1, 0]], "6": [[0, 0, 0, 1], [4, 0, 0, 0], [0, 0, 0, 3], [6, 0, 3, 0]],"7":  [[0, 3, 0, 6], [4, 0, 0, 0], [0, 0, 0, 3], [6, 0, 3, 0]], "8":  [[0, 0, 0, 0], [4, 0, 0, 0], [0, 0, 0, 3], [6, 0, 3, 0]], "9": [[0, 2, 0, 0], [3, 0, 0, 0], [0, 0, 4, 0], [1, 0, 0, 0]], "10": [[0, 0, 0, 2], [4, 0, 0, 0], [0, 0, 0, 3], [1, 0, 3, 0]]} 
        for key, value in data.items():
            correct = True
            for i in range(len(value)):
                for j in range(len(value)):
                    if value[i][j]!=value[j][i]:
                        correct=False
            self.assertFalse(correct)

if __name__ == '__main__':
    unittest.main()
