
sonIguales :: Eq(t) => t -> t -> Bool
sonIguales x y = x == y

estaEnLaTupla :: Eq(c) => c -> (c, c) -> Bool
estaEnLaTupla c (a,b) = (c == a) || (c == b)

laOtraComponente :: Eq(t) => t -> (t,t) -> t
laOtraComponente componente (a, b) | componente == a = b
                                   | componente == b = a


unirCaracteres :: [Char] -> String
unirCaracteres [x] = caracterComoCadena x
unirCaracteres (x:xs) = (caracterComoCadena x) ++ unirCaracteres xs

caracterComoCadena :: Char -> String
caracterComoCadena c = [c]

primero :: tx -> ty -> tx
primero x y = x

segundo :: tx -> ty -> ty
segundo x y = y

constante5 :: tx -> ty -> tz -> Int
constante5 x y z = 5

mismoTipo :: t -> t -> Bool
mismoTipo x y = True



--(5.1.1)
longitud :: [t] -> Int 
longitud [] = 0
longitud (_:restoDeLaLista) = 1 + longitud restoDeLaLista

longitud2 :: [t] -> Int 
longitud2 (_:xs) = 1 + longitud xs

--(5.1.2)
ultimo :: [t] -> t 
ultimo l = l!! ((longitud l) - 1)

--(5.1.3)
principio :: [t] -> [t]
principio [_] = []
principio (x:xs) = (x:(principio xs))

--(5.1.4)
reverso :: [t] -> [t]
reverso l | longitud l == 1 = l
          | longitud l > 1 = [ultimo l] ++ reverso (principio l)

--(5.2.1)
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece e l | (e == (ultimo l)) == True = True
              | (longitud l == 1) && ((e == (ultimo l)) == False) = False
              | (longitud l > 1) && ((e == (ultimo l)) == False) = pertenece e (principio l)

--(5.2.2)
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:y:xs) = (x == y) && todosIguales (y:xs)

--(5.2.3)
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x:xs) = ((pertenece x xs) == False) && todosDistintos xs

--(5.2.4)
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos l | todosIguales l == True = True
               | todosDistintos l == False = True
               | otherwise = False


--(5.2.5)
estaEnLaLista :: Eq(t) => t -> [t] -> Bool --AUX
estaEnLaLista _ [] = False
estaEnLaLista item (x:xs) | item == x = True
                          | otherwise = estaEnLaLista item xs

quitar :: (Eq t) => t -> [t] -> [t]
quitar item lista | not (estaEnLaLista item lista) = lista
                  | (estaEnLaLista item lista) = quitarPrimerItem item lista []

agregarAlFinal :: t -> [t] -> [t] --AUX
agregarAlFinal i [] = [i]
agregarAlFinal i (x:xs) = (x:((agregarAlFinal i) xs))

quitarPrimerItem :: (Eq t) => t -> [t] -> [t] -> [t] --AUX
quitarPrimerItem i (x:xs) lista_final | i /= x = quitarPrimerItem i xs (agregarAlFinal x lista_final)
                                      | i == x = lista_final ++ xs


--(5.2.6)
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos item lista | not (estaEnLaLista item lista) = lista
                       | (estaEnLaLista item lista) = quitarTodos item (quitar item lista)

--(5.2.7)
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos [x] = [x]
eliminarRepetidos lista | not (hayRepetidos lista) = lista 
                        | hayRepetidos lista = filtrarRepetidos lista 0
                                                       
filtrarRepetidos :: Eq(t) => [t] -> Int -> [t] --AUX
filtrarRepetidos lista indice | indice == longitud lista = lista
                              | not (hayRepetidos lista) = filtrarRepetidos lista (indice + 1)
                              | hayRepetidos lista = filtrarRepetidos ((lista!!indice) : (quitarTodos (lista!!indice) lista)) (indice + 1)

--(5.2.8) 
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos lista_a lista_b | (compararListas lista_a lista_b) && (compararListas lista_b lista_a) = True
                                | otherwise = False

compararListas :: Eq(t) => [t] -> [t] -> Bool --AUX
compararListas [] lista = True
compararListas (x:xs) lista = (estaEnLaLista x lista) && (compararListas xs lista)

--(5.2.9)
capicua :: (Eq t) => [t] -> Bool
capicua [_] = True
capicua lista = lista == reverso lista

--(5.3.1)
sumatoria :: [Integer] -> Integer 
sumatoria [] = 0
sumatoria (x:xs) = sumatoria xs + x


--(5.3.2)
productoria :: [Integer] -> Integer 
productoria [] = 1
productoria (x:xs) = x * productoria xs


--(5.3.3)
valorMaximoEnListaZ :: [Integer] -> Integer
valorMaximoEnListaZ [x] = x
valorMaximoEnListaZ (x:xs) = obtenerMayor x xs 0

obtenerMayor :: Integer -> [Integer] -> Integer -> Integer --AUX
obtenerMayor n [] mayor = mayor
obtenerMayor n (x:xs) mayor | n == x = obtenerMayor n xs n
                            | n > x = obtenerMayor n xs n
                            | n < x = obtenerMayor x xs x

--(5.3.4)
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [] = [n]
sumarN n [x] = [(n + x)]
sumarN n (x:xs) = (n + x) : (sumarN n xs)

--(5.3.5)
sumarElPrimero :: [Integer] -> [Integer] 
sumarElPrimero [x] = [x + x]
sumarElPrimero (x:xs) = (x + x) : (sumarN x xs)

--(5.3.6)
sumarElUltimo :: [Integer] -> [Integer] 
sumarElUltimo [x] = [x + x]
sumarElUltimo (x:xs) = (x + (ultimo (x:xs))) : (sumarN (ultimo (x:xs)) xs)

--(5.3.7)
soloParesEnLista :: [Integer] -> [Integer]
soloParesEnLista [] = []
soloParesEnLista [x] | esPar x = [x]
                     | otherwise = []
soloParesEnLista (x:xs) | esPar x = (x):(soloParesEnLista xs)
                        | otherwise = soloParesEnLista xs

--(5.3.8)
esMultiploDeN :: Integer -> Integer -> Bool --AUX
esMultiploDeN 0 0 = True
esMultiploDeN _ 0 = False
esMultiploDeN z n | z `mod` n == 0 = True
                  | otherwise = False

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN n [] = []
multiplosDeN n [x] | esMultiploDeN x n = [x]
                   | otherwise = []
multiplosDeN n (x:xs) | esMultiploDeN x n = (x) : (multiplosDeN n xs)
                      | otherwise = multiplosDeN n xs


--(5.3.9)

valorMinimoEnListaZ :: [Integer] -> Integer
valorMinimoEnListaZ [x] = x
valorMinimoEnListaZ (x:xs) = obtenerMenor x xs 0

obtenerMenor :: Integer -> [Integer] -> Integer -> Integer --AUX
obtenerMenor n [] menor = menor
obtenerMenor n (x:xs) menor | n == x = obtenerMenor n xs n
                            | n < x = obtenerMenor n xs n
                            | n > x = obtenerMenor x xs x

ordenar :: [Integer] -> [Integer]
ordenar [x] = [x]
ordenar s = reverso (ordenarDecreciente s)

ordenarDecreciente:: [Integer] -> [Integer] --AUX
ordenarDecreciente [x] = [x]
ordenarDecreciente s = valorMaximoEnListaZ s : ordenarDecreciente (quitar (valorMaximoEnListaZ s) s)


--(5.4.1)

sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:xs) | (x /= ' ') = x : sacarBlancosRepetidos xs
                             | (x == ' ') && (head xs == ' ') = sacarBlancosRepetidos xs
                             | otherwise = x : sacarBlancosRepetidos xs 


--(5.4.2)
contarPalabras :: [Char] -> Integer
contarPalabras [] = 0
contarPalabras [x] | x == ' ' = 0
                   | otherwise = 1
contarPalabras (x:xs) | (x /= ' ') && (head xs == ' ') = 1 + contarPalabras (sacarBlancosRepetidos xs)
                      | otherwise = contarPalabras (sacarBlancosRepetidos xs)


--(5.4.3)
extraerPrimerPalabra :: [Char] -> [Char] --AUX
extraerPrimerPalabra [] = []
extraerPrimerPalabra [x] | x == ' ' = []
                   | otherwise = [x]
extraerPrimerPalabra (x:xs) | (x == ' ') && (head xs /= ' ') = [] ++ extraerPrimerPalabra xs
                      | (x /= ' ') && (head xs == ' ') = [x]
                      | (x /= ' ') = [x] ++ extraerPrimerPalabra xs
                      | otherwise = xs

borrarPrimerPalabra :: [Char] -> [Char] --AUX
borrarPrimerPalabra [] = []
borrarPrimerPalabra (x:xs) | x /= ' ' = borrarPrimerPalabra xs
                           | otherwise = xs
                           
palabras :: [Char] -> [[Char]]
palabras [] = []
palabras [x] = [[x]]
palabras (x:xs) | x == ' ' = palabras xs
                | x /= ' ' =  ((extraerPrimerPalabra (x:xs)):) [] ++ palabras (borrarPrimerPalabra (sacarBlancosRepetidos (x:xs))) 
        

--(5.4.4)
palabraMasLarga :: [Char] -> [Char]
palabraMasLarga lista = cadenaMax (palabras lista)

cadenaMax :: [[Char]] -> [Char] --AUX
cadenaMax [x] = x
cadenaMax (x:xs) = obtenerCadenaMax x xs []

obtenerCadenaMax :: [Char] -> [[Char]] -> [Char] -> [Char] --AUX
obtenerCadenaMax c [] mayor = mayor
obtenerCadenaMax c (x:xs) mayor | longitud c == longitud x = obtenerCadenaMax c xs c
                                | longitud c > longitud x = obtenerCadenaMax c xs c
                                | longitud c < longitud x = obtenerCadenaMax x xs x

--(5.4.5)
aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = x ++ (aplanar xs)


--(5.4.6)
aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos [x] = x
aplanarConBlancos (x:xs) = x ++ [' '] ++ (aplanarConBlancos xs)

--(5.4.7)
aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [] _ = []
aplanarConNBlancos [x] _ = x
aplanarConNBlancos (x:xs) n = x ++ (nBlancos n) ++ (aplanarConNBlancos xs n)

nBlancos :: Integer -> [Char] --AUX
nBlancos n | n == 0 = []
           | otherwise = [' '] ++ nBlancos (n-1)

--(5.5.1)
sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada [x] = [x]
sumaAcumulada (x:xs) = sumaAcuAux (x:xs) 0 

sumaAcuAux :: (Num t) => [t] -> t -> [t]
sumaAcuAux [x] val = [x + val]
sumaAcuAux (x:xs) val = (x + val): sumaAcuAux xs (val + x) 

--(5.5.2)
descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos [x] = (primosDeN x 2 []) : []
descomponerEnPrimos (x:xs) = (primosDeN x 2 []) : [] ++ descomponerEnPrimos xs

primosDeN :: Integer -> Integer -> [Integer] -> [Integer] --AUX
primosDeN n p lista_primos | esPrimo n = [n]
                           | not (esFactor n p) = primosDeN n (siguientePrimo p) lista_primos 
                           | (esFactor n p) && (esPrimo (div n p)) = lista_primos ++ [p, (div n p)]
                           | (esFactor n p) && not (esPrimo (div n p)) = primosDeN (div n p) (p) ((p:) lista_primos)
                           | otherwise = lista_primos
                               
esFactor :: Integer -> Integer -> Bool --AUX
esFactor n p = mod n p == 0
