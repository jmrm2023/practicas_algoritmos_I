import unittest
from guia_8 import *


class Ejercicio11Test(unittest.TestCase):  
    
    def test_trivial(self):
        res = bien_balanceada("2 + 5")
        self.assertEqual(res, True)
        
    def test_ejemplo_1(self):
        res = bien_balanceada('1 + (2 x 3 = (20 / 5))')
        self.assertEqual(res, True)
    
    def test_ejemplo_2(self):
        res = bien_balanceada('10 * ( 1 + ( 2 * ( - 1)))')
        self.assertEqual(res, True)

    def test_ejemplo_3(self):
        res = bien_balanceada('1 + ) 2 x 3 ( ()')
        self.assertEqual(res, False)
        
    def test_ejemplo_5(self):
        res = bien_balanceada('(45 - ((5 * -3) / ((-1) * 7 + 1))) / (-2 + 9)')
        self.assertEqual(res, False)


class Ejercicio12Test(unittest.TestCase):
    
    def test_ejemplo_1(self):
        res_esperado = 33
        res = postfix("3 4 + 5 * 2 -")
        self.assertEqual(res, res_esperado)
        
    def test_ejemplo_2(self):
        res_esperado = 117
        res = postfix("4 5 + 6 7 + *")
        self.assertEqual(res, res_esperado)

    def test_ejemplo_3(self):
        res_esperado = 21
        res = postfix("1 2 3 4 5 6 + + + + +")
        self.assertEqual(res, res_esperado)

    def test_ejemplo_4(self):
        res_esperado = 141
        res = postfix("2 3 - 4 + 5 6 7 * + *")
        self.assertEqual(res, res_esperado)



(4 + 5) * (6 + 7)
if __name__ == '__main__':
    unittest.main(verbosity=2)
