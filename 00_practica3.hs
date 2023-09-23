f n | n == 1 = 8
    | n == 4 = 131
    | n == 16 = 16
    | otherwise = -1


g n | n == 8 = 16
    | n == 16 = 4
    | n == 131 = 1
    | otherwise = -1

-- f ◦ g
h n = f (g n)

-- g ◦ f
k n = g (f n)

-- calcula el valor absoluto de un número entero
absoluto :: Integer -> Integer
absoluto n = abs(n)

-- devuelve el máximo entre el valor absoluto de dos números enteros
maximoAbsoluto :: Integer -> Integer -> Integer
maximoAbsoluto x y | absoluto(x) > absoluto(y) = absoluto(x)
                   | otherwise = absoluto(y)

-- devuelve el máximo entre tres números enteros
maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 x y z | z > maximoAbsoluto x y = z
              | otherwise = maximoAbsoluto x y

-- dados dos números racionales, decide si alguno de los dos es igual a 0
algunoEs0 :: Rational -> Rational -> Bool
algunoEs0 x y = x == 0 || y == 0

-- lo mismo, con Pattern Matching
algunoEs0Pat :: Rational -> Rational -> Bool
algunoEs0Pat 0 y = True
algunoEs0Pat x 0 = True
algunoEs0Pat _ _ = False

-- dados dos números racionales, decide si ambos son iguales a 0
ambosSon0 :: Rational -> Rational -> Bool
ambosSon0 x y = x == 0 && y == 0

-- lo mismo, con Pattern Matching
ambosSon0Pat :: Rational -> Rational -> Bool
ambosSon0Pat 0 0 = True
ambosSon0Pat _ _ = False

-- indica si están relacionados considerando la relación de equivalencia en ℝ
-- cuyas clases de equivalencia son: (−∞, 3], (3, 7], (7, ∞) 
-- o dicho de otra forma, si pertenecen al mismo intervalo
mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y = (x <= 3) && (y <= 3) || ((3 < x) && (x <= 7)) && ((3 < y) && (y <= 7)) || (x > 7) && (y > 7)
        
-- dados tres números enteros calcule la suma sin sumar repetidos (si los hubiera)
sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos x y z | (x == y) && (y == z) = x 
                    | (x == y) && (y /= z) = y + z 
                    | (x /= y) && (y == z) = x + y
                    | (x /= y) && (x == z) = x + y
                    | otherwise = x + y + z

-- dados dos números naturales, decide si el primero es múltiplo del segundo
esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe x y | x < y = False
                 | y == 1 = True
                 | x `mod` y == 0 = True
                 | otherwise = False

-- dado un número natural, extrae su dı́gito de las unidades
digitoUnidades :: Integer -> Integer
digitoUnidades x | x < 10 = x
                 | x > 10 = x `mod` 10

-- dado un número natural, extrae su dı́gito de las decenas
digitoDecenas :: Integer -> Integer
digitoDecenas x | x < 100 = (x - digitoUnidades(x)) `div` 10
                | x > 100 = digitoUnidades((x - digitoUnidades(x)) `div` 10)
                | otherwise = 0 


-- {(res = true) ↔ a∗a + a∗b∗k = 0 para algún k ∈ Z con k ≠ 0)}
estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b = (a*a) `mod` (a*b) == 0



-- EJERCICIOS

{- 
a) prodInt: calcula el producto interno entre dos tuplas ℝ🞪ℝ.

□ ESPECIFICACIÓN:
problema prodInt(x: ℝ 🞪 ℝ, y: ℝ 🞪 ℝ): ℝ {
requiere : {True}
asegura : { res = r ∈ ℝ, tal que x1*y1 + x2*y2 = r}
} ▧ 
-}

prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt (a, b) (c, d) = (a*c) + (b*d)




{- 
b) todoMenor: dadas dos tuplas ℝ 🞪 ℝ, decide si es cierto que
cada coordenada de la primera tupla es menor a 
la coordenada correspondiente de la segunda tupla.

□ ESPECIFICACIÓN:
problema todoMenor(x: ℝ 🞪 ℝ, y: ℝ 🞪 ℝ): Bool {
requiere : {True}
asegura : {(res = True) ⟺ (x1 < y1) ⋀ (x2 < y2)}
} ▧ 
-}

todoMenor:: (Float, Float) -> (Float, Float) -> Bool
todoMenor (a, b) (c, d) = (a < c) && (b < d)




{- 
c) distanciaPuntos: calcula la distancia entre dos puntos de ℝ².

□ ESPECIFICACIÓN:
problema distanciaPuntos(x: ℝ 🞪 ℝ, y: ℝ 🞪 ℝ): ℝ {
requiere : {True}
asegura : {(res = d(x, y)) ⟺ d(x, y) = √[(x1 − y1)² + (x2 − y2)²]}
} ▧ 
-}

distanciaPuntos:: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (a, b) (c, d) = sqrt(((a - c)**2) + ((b - d)**2))




{- 
d) sumaTerna: dada una terna de enteros, calcula la suma de sus tres elementos.

□ ESPECIFICACIÓN:
problema sumaTerna(x: ℤ 🞪 ℤ 🞪 ℤ): ℤ {
requiere : {True}
asegura : {(res = r ∈ ℤ) ⟺ x1 + x2 + x3 = r}
} ▧ 
-}

sumaTerna:: (Integer, Integer, Integer) -> Integer
sumaTerna (a, b, c) = a + b + c




{- 
e) sumarSoloMultiplos: dada una terna de números enteros y un natural, 
calcula la suma de los elementos de la terna que son múltiplos del número natural. 

□ ESPECIFICACIÓN:
problema sumaSoloMultiplos(x: ℤ 🞪 ℤ 🞪 ℤ, n: ℕ): ℤ {
requiere : {True}
asegura : {(res es la suma de cada componente z ∈ x ⟺ (esMultiploDe(z: ℤ, n: ℕ))}
} ▧ 
-}

esMultiploDe :: Integer -> Integer -> Integer
esMultiploDe z n | n == 0 = 0
                 | n == 1 = z
                 | z `mod` n == 0 = z
                 | otherwise = 0

sumaSoloMultiplos:: (Integer, Integer, Integer) -> Integer -> Integer
sumaSoloMultiplos (a, b, c) n = (esMultiploDe a n) + (esMultiploDe b n) + (esMultiploDe c n) 




{- 
f) posPrimerPar: dada una terna de enteros, devuelve la posición 
del primer número par si es que hay alguno, y devuelve 4 si son todos impares.

□ ESPECIFICACIÓN:
problema posPrimerPar(x: ℤ 🞪 ℤ 🞪 ℤ): ℤ {
requiere : {True}
asegura : {res es la posición de la primer componente de x que esPar(z: ℤ) o
           4 si ninguna esPar(z: ℤ)}
} ▧ 
-}

esPar :: Integer -> Integer
esPar z | z `mod` 2 == 0 = 1
        | otherwise = 0

posPrimerPar :: (Integer, Integer, Integer) -> Integer
posPrimerPar (a, b, c) | (esPar a) == 1 = 0
                       | (esPar b) == 1 = 1
                       | (esPar c) == 1 = 2
                       | otherwise = 4



{- 
g) crearPar: crea un par a partir de sus dos componentes 
dadas por separado (debe funcionar para elementos de cualquier tipo).

□ ESPECIFICACIÓN:
problema creaerPar(a: T, b: T): (a, b) {
requiere : {True}
asegura : {res es un par con la primera y segunda componente}
} ▧ 
-}

crearPar :: a -> b -> (a, b)
crearPar a b = (a, b)




{- 
invertir :: (a, b) ->(b, a): invierte los elementos del par pasado como parámetro (debe funcionar para elementos
de cualquier tipo).

□ ESPECIFICACIÓN:
problema invertir(a: T, b: T): (b, a) {
requiere : {True}
asegura : {res es un par con la posicion de los elementos invertida del par pasado como parámetro}
} ▧ 
-}

invertir :: (a, b) -> (b, a)
invertir (a, b) = (b, a)



-- Ejercicio 5

esPar :: Integer -> Integer
esPar z | z `mod` 2 == 0 = 1
        | otherwise = 0

todosMenores :: (Integer, Integer, Integer) -> Bool
todosMenores (a, b, c) = f a > g a && f b > g b && f c > g c

f :: Integer -> Integer
f n | n <= 7 = 2*n
    | n > 7 = 2*n -1

g :: Integer -> Integer
g n | (esPar n) == 1 = n `div` 2
    | otherwise = 3*n + 1




-- Ejercicio 6

bisiesto :: Integer -> Bool
bisiesto a = (a `mod` 4 == 0) && ((a `mod` 100 /= 0) || (a `mod` 400 == 0))




-- Ejercicio 7
sumaTerna:: (Float, Float, Float) -> Float
sumaTerna (a, b, c) = a + b + c

distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (a,b,c) (d,e,f) = sqrt((sumaTerna(a,b,c) - sumaTerna(d,e,f))*(sumaTerna(a,b,c) - sumaTerna(d,e,f)))




-- Ejercicio 8

comparar :: Integer -> Integer -> Integer
comparar a b | sumaUltimosDosDigitos a < sumaUltimosDosDigitos b = 1
             | sumaUltimosDosDigitos a > sumaUltimosDosDigitos b = -1
             | sumaUltimosDosDigitos a == sumaUltimosDosDigitos b = 0

-- dado un número natural, extrae su dı́gito de las unidades
digitoUnidades :: Integer -> Integer
digitoUnidades x | x < 10 = x
                 | x > 10 = x `mod` 10

-- dado un número natural, extrae su dı́gito de las decenas
digitoDecenas :: Integer -> Integer
digitoDecenas x | x < 100 = (x - digitoUnidades(x)) `div` 10
                | x > 100 = digitoUnidades((x - digitoUnidades(x)) `div` 10)
                | otherwise = 0 

sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos x = (digitoDecenas x) + (digitoUnidades x)

{-

Ejercicio 9

a) recibe un real n y retorna 1 si n es igual a cero, caso contrario retorna cero.
b) recibe un real n y retorna 15 si n es igual a uno, y retorna -15 si n es igual a menos uno.
c) recibe un real n y retorna 7 si es menor o igual a nueve, o 5 si es mayor o igual a 3.
d) retorna la mitad de la suma de dos numeros reales que recibe como parametro.
e) retorna la mitad de la suma de las dos componentes de una tupla de reales que recibe como parametro.
f) retorna un booleano con el valor de la comparacion de igualdad entre la parte entera del real y el entero que recibe como parametros.  
-}
