import unittest

class Test_test_prim_true_sum(unittest.TestCase):
    def test_A(self):
        data={"1": [[0, 2, 0, 0, 0], [2, 0, 2, 0, 0], [0, 2, 0, 1, 0], [0, 0, 1, 0, 1], [0, 0, 0, 1, 0]], "2":  [[0, 0, 1, 1, 0], [0, 0, 0, 3, 0], [1, 0, 0, 0, 1], [1, 3, 0, 0, 0], [0, 0, 1, 0, 0]], "3":   [[0, 0, 15], [0, 0, 6], [15, 6, 0]],  "4":  [[0, 0, 0, 6], [0, 0, 3, 4], [0, 3, 0, 0], [6, 4, 0, 0]]}
        sum_d={"1":6,"2":6,"3":21,"4":13}
        sum_res={}
        sum=0
        correct=True
        for key, value in data.items():
            for i in range(len(value)):
                for j in range(len(value)):
                    sum+= value[i][j]
                sum_res[key]=sum/2
            sum=0
            if sum_res[key]!=sum_d[key]:
                correct = False
 
        self.assertTrue(correct)
                    
if __name__ == '__main__':
    unittest.main()
