--BASICAS SOBRE LISTAS
primero :: [t] -> t
primero (x:_) = x

ultimo :: [t] -> t
ultimo [x] = x
ultimo (_:xs) = ultimo xs

enesimo :: [t] -> Int -> t
enesimo (x:_) 0 = x
enesimo (_:xs) n = enesimo xs (n-1)

longitud :: [t] -> Integer
longitud [] = 0
longitud [x] = 1
longitud (x:xs) = 1 + longitud xs

principio :: [t] -> [t]
principio [] = []
principio [_] = []
principio (x:xs) = x:[] ++ principio xs


alReves :: [t] -> [t]
alReves [] = []
alReves (x:xs) = alReves xs ++ [x]

pertenece :: Eq(t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e [x] = e == x
pertenece e (x:xs) | e /= x = pertenece e xs
                   | otherwise = True 


--PRIMOS
divisoresDeN :: Integer -> Integer -> [Integer] --AUX
divisoresDeN _ 1 = [1]
divisoresDeN dividendo divisor | dividendo `mod` divisor == 0 = divisor:[] ++ (divisoresDeN dividendo (divisor - 1))
                               | otherwise = [] ++ (divisoresDeN dividendo (divisor - 1))

divisoresPrimosDeN :: Integer -> Integer -> [Integer] --AUX
divisoresPrimosDeN _ 1 = []
divisoresPrimosDeN dividendo divisor | not (esPrimo divisor) = [] ++ (divisoresPrimosDeN dividendo (divisor - 1))
                                     | dividendo `mod` divisor == 0 = divisor:[] ++ (divisoresPrimosDeN dividendo (divisor - 1))
                                     | otherwise = [] ++ (divisoresPrimosDeN dividendo (divisor - 1))

esFactor :: Integer -> Integer -> Bool --AUX
esFactor n p = mod n p == 0

primosDeN :: Integer -> Integer -> [Integer] -> [Integer] --AUX
primosDeN n _ _ | n <= 1 = []
primosDeN n p lista_primos | esPrimo n = [n]
                           | not (esFactor n p) = primosDeN n (siguientePrimo p) lista_primos 
                           | (esFactor n p) && (esPrimo (div n p)) = lista_primos ++ [p, (div n p)]
                           | (esFactor n p) && not (esPrimo (div n p)) = primosDeN (div n p) (p) ((p:) lista_primos)
                           | otherwise = lista_primos  

factoresPrimosDeN :: Integer -> [Integer] --PRIN
factoresPrimosDeN n = divisoresPrimosDeN n n

esPrimo :: Integer -> Bool --PRIN
esPrimo n = (divisoresDeN n n) == [n, 1]

siguientePrimo :: Integer -> Integer --PRIN
siguientePrimo n | esPrimo (n + 1) = (n + 1)
                 | otherwise = siguientePrimo (n + 1)

anteriorPrimo :: Integer -> Integer --PRIN
anteriorPrimo n | esPrimo (n - 1) = (n - 1)
                | otherwise = anteriorPrimo (n - 1)

listaDePrimosAnteriores :: Integer -> [Integer] --PRIN
listaDePrimosAnteriores 1 = []
listaDePrimosAnteriores n | esPrimo (n - 1) = (n - 1):[] ++ listaDePrimosAnteriores (n - 1)
                          | otherwise = [] ++ listaDePrimosAnteriores (n - 1)

descomponerEnPrimos :: [Integer] -> [[Integer]] --PRIN
descomponerEnPrimos [] = []
descomponerEnPrimos [x] = (primosDeN x 2 []) : []
descomponerEnPrimos (x:xs) = (primosDeN x 2 []) : [] ++ descomponerEnPrimos xs


--CONGRUENCIA
sonCongruentes :: Integer -> Integer -> Integer -> Bool
sonCongruentes a b n = mod (a - b) n == 0


--CONVERTIR NUMEROS A DISTINTAS BASES
baseDecimalAOtraBase :: Integer -> Integer -> [Integer] -> [Integer] --AUX
baseDecimalAOtraBase _ base _ | base > 10 = [0]
baseDecimalAOtraBase n base res | n < base = (mod n base):res
                            | n >= base = baseDecimalAOtraBase (div n base) base ((mod n base):res)

otraBaseABaseDecimal :: [Integer] -> Integer -> Integer -> Integer --AUX
otraBaseABaseDecimal _ base _ | base > 10 = 0
otraBaseABaseDecimal [res] base n = n + res
otraBaseABaseDecimal (res:restos) base n = otraBaseABaseDecimal restos base ((n + res) * base)


baseDecimalABaseN :: Integer -> Integer -> [Integer] --PRIN
baseDecimalABaseN n base = baseDecimalAOtraBase n base []

baseNABaseDecimal :: [Integer] -> Integer -> Integer --PRIN
baseNABaseDecimal n_ario base_n = otraBaseABaseDecimal n_ario base_n 0



--COMBINACIONES
factorial :: Integer -> Integer --AUX
factorial n | n == 0 = 1
            | otherwise = n * factorial (n-1)  

numeroCombinatorio :: Integer -> Integer -> Integer --PRIN
numeroCombinatorio n k | k > n = 0
                       | otherwise = div (factorial n) ((factorial k)*(factorial (n - k)))


--TRIANGULO DE PASCAL
pascal :: Integer -> IO()
pascal n = mapM_ print (coeficientesPascal n)

coeficientesPascal :: Integer -> [[Integer]] --AUX
coeficientesPascal 0 = [[1]]
coeficientesPascal n = [[1]] ++ (generarListaDeListas [1] n) 

generarListaDeListas :: [Integer] -> Integer-> [[Integer]] --AUX
generarListaDeListas lista 0 = []
generarListaDeListas lista i = (unirListaDeCoeficientes lista):[] ++ generarListaDeListas (unirListaDeCoeficientes lista) (i - 1)

unirListaDeCoeficientes :: [Integer] -> [Integer] --AUX
unirListaDeCoeficientes (x:xs) = [x] ++ listaDeCoeficientes (x:xs)

listaDeCoeficientes :: [Integer] -> [Integer] --AUX
listaDeCoeficientes [_] = [1]
listaDeCoeficientes (x:xs) = ((x + (head xs)):)[] ++ (listaDeCoeficientes xs)


--OTROS
maxRegionesEnElPlano :: Integer -> Integer
maxRegionesEnElPlano 0 = 1
maxRegionesEnElPlano lineas_trazadas = (maxRegionesEnElPlano (lineas_trazadas - 1)) + lineas_trazadas