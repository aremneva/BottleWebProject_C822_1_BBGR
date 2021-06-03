import unittest, connectivity_check

class Test_test_dfs_connectivity_false(unittest.TestCase):
    def test_A(self):
        data = {"1":{"vertices": 2, "input": [[0, 0], [0, 0]]}, "2": {"vertices": 3, "input": [[0, 0, 1], [0, 0, 0], [1, 0, 0]]}, "3": {"vertices": 6, "input": [[0, 1, 0, 0, 0, 0], [1, 0, 1, 0, 1, 0], [0, 1, 0, 0, 1, 0], [0, 0, 0, 0, 0, 1], [0, 1, 1, 0, 0, 0], [0, 0, 0, 1, 0, 0]]}, "4": {"vertices": 4, "input": [[0, 1, 1, 0], [1, 0, 1, 0], [1, 1, 0, 0], [0, 0, 0, 0]]}, "5": {"vertices": 6, "input": [[0, 0, 1, 0, 0, 0], [0, 0, 1, 0, 1, 0], [1, 1, 0, 0, 1, 1], [0, 0, 0, 0, 0, 0], [0, 1, 1, 0, 0, 1], [0, 0, 1, 0, 1, 0]]}, "6": {"vertices": 6, "input": [[0, 0, 0, 0, 0, 0], [0, 0, 1, 0, 1, 0], [0, 1, 0, 1, 1, 0], [0, 0, 1, 0, 1, 1], [0, 1, 1, 1, 0, 0], [0, 0, 0, 1, 0, 0]]}, "7": {"vertices": 5, "input": [[0, 1, 0, 0, 0], [1, 0, 0, 0, 0], [0, 0, 0, 1, 1], [0, 0, 1, 0, 0], [0, 0, 1, 0, 0]]}, "8": {"vertices": 4, "input": [[0, 0, 0, 0], [0, 0, 1, 0], [0, 1, 0, 0], [0, 0, 0, 0]]}}
        for key, value in data.items():
            self.assertFalse((connectivity_check.dfs_check(value['input']) == value['vertices']))

if __name__ == '__main__':
    unittest.main()
