import unittest

class Test_test_prim_true_sum(unittest.TestCase):
    def test_A(self):
        data={"1": [[0, 2, 0, 0, 0], [2, 0, 2, 0, 0], [0, 2, 0, 1, 0], [0, 0, 1, 0, 1], [0, 0, 0, 1, 0]], "2":  [[0, 0, 1, 1, 0], [0, 0, 0, 3, 0], [1, 0, 0, 0, 1], [1, 3, 0, 0, 0], [0, 0, 1, 0, 0]], "3":   [[0, 0, 15], [0, 0, 6], [15, 6, 0]],  "4":  [[0, 0, 0, 6], [0, 0, 3, 4], [0, 3, 0, 0], [6, 4, 0, 0]]}
        sum_d={"1":102,"2":2,"3":31,"4":9}
        sum_res={}
        sum=0
        for key, value in data.items():
            correct=False
            for i in range(len(value)):
                for j in range(len(value)):
                    sum+= value[i][j]
                sum_res[key]=sum/2
                if sum_res[key]==sum_d[key]:correct = True
                self.assertFalse(correct)
            sum=0

if __name__ == '__main__':
    unittest.main()
