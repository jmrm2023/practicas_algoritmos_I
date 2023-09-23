-- PRÁCTICA 4


-- Ejercicio 1

fibonacci :: Integer -> Integer
fibonacci n | n == 0 = 0
            | n == 1 = 1
            | n >= 2 = fibonacci (n-1) + fibonacci (n-2)
            



-- Ejercicio 2
parteEntera :: Float -> Integer
parteEntera x = truncate x





{- Ejercicio 3
Especificar e implementar la función esDivisible :: Integer -> Integer ->Bool que dados dos números
naturales determinar si el primero es divisible por el segundo. No está permitido utilizar las funciones mod ni div.

problema esDivisible(m:ℕ, n:ℕ): Bool {
requiere: { m > 0, n > 0}
asegura: {resultado = True ⟺ (m/n) = k, tal que k ∈ ℕ }
} 
-}

esDivisible :: Integer -> Integer -> Bool
esDivisible m n = m `rem` n == 0 





{-Ejercicio 4
Especificar e implementar la función sumaImpares :: Integer ->Integer que dado n ∈ N sume los primeros
n números impares. Por ejemplo: sumaImpares 3 ; 

□ ESPECIFICACIÓN:
problema sumaImpares(n:ℕ): Integer {
requiere: {n > 0}
asegura: {resultado es la suma del último impar(x) ⩽ n, junto a todos los anteriores hasta 1}
} ▧
-}

sumaImpares :: Integer -> Integer
sumaImpares n | n == 1 = 1
              | n > 1 = impar n + sumaImpares (n - 1)
              where impar x | x `rem` 2 /= 0 = x
                            | otherwise = 0

   



-- Ejercicio 5
-- Implementar la función medioFact :: Integer ->Integer que dado n ∈ N calcula n!! = n (n − 2)(n − 4) · · · .
medioFact :: Integer -> Integer
medioFact n | n <= 1 = 1
            | n > 1 = n * medioFact (n - 2)






{-
Ejercicio 6. Especificar e implementar la función sumaDigitos :: Integer ->Integer que calcula la suma de dı́gitos de
un número natural. Para esta función pueden utilizar div y mod.
-}

sumaDigitos :: Integer -> Integer
sumaDigitos n | n < 10 = n
              | n > 10 = (n `mod` 10) + sumaDigitos (n `div` 10)







{-
Ejercicio 7. Implementar la función todosDigitosIguales :: Integer ->Bool que determina si todos los dı́gitos de un
número natural son iguales, es decir:

problema todosDigitosIguales (n: Z) : B {
requiere: { n > 0 }
asegura: { resultado = true ↔ todos los dı́gitos de n son iguales }
}
-}

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n | n < 10 = True
                      | n `mod` 10 == ultimoDigito (n `div` 10) = True
                      | n `mod` 10 /= ultimoDigito (n `div` 10) = False
                      where ultimoDigito x = x `mod` 10





{-
Ejercicio 8. Implementar la función iesimoDigito :: Integer ->Integer ->Integer que dado un n ∈ N≥0 y un i ∈ N
menor o igual a la cantidad de dı́gitos de n, devuelve el i-ésimo dı́gito de n.

problema iesimoDigito (n: Z, i: N) : Z {
requiere: { n ≥ 0 ∧ 1 ≤ i ≤ cantDigitos(n) }
asegura: { resultado = (n div 10cantDigitos(n)−i ) mod 10 }
}
problema cantDigitos (n: Z) : N {
requiere: { n ≥ 0 }
asegura: { n = 0 → resultado = 1}
asegura: { n 6= 0 → (n div 10resultado−1 > 0 ∧ n div 10resultado = 0) }
}
-}

cantDigitos :: Integer -> Integer
cantDigitos x | x < 10 = 1
              | x >= 10 = 1 + cantDigitos (sacarUltimoDigito x)
              where sacarUltimoDigito y = y `div` 10

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i | i > cantDigitos n = 0
                 | i == cantDigitos n = ultimoDigito n
                 | i < cantDigitos n = iesimoDigito (sacarUltimoDigito n) i
                 where sacarUltimoDigito y = y `div` 10
                       ultimoDigito x = x `mod` 10





{-
Ejercicio 9. Especificar e implementar una función esCapicua :: Integer -> Bool que dado n ∈ N≥0 determina si n es
un número capicúa.

□ ESPECIFICACIÓN:
problema esCapicua (n:ℕ): Bool {
requiere: { n ≥ 0}
requiere: { no debe habeer ceros a la izquierda de n}
asegura: { resultado = True ⟺ el resultado de comparar el primer digito con el ultimo,e
           el segundo con el anteultimo, ..., da siempre verdadero}
}▧
-}

comparar :: Integer -> Integer -> Bool
comparar x i | i > cantDigitos x = True
             | x < 10 = True
             | ((iesimoDigito x i) == (x `mod` 10)) == True = comparar (x `div` 10) (i + 1)
             | otherwise = False

esCapicua :: Integer -> Bool
esCapicua n = comparar n 1 == True








-- Ejercicio 10. Especificar, implementar y dar el tipo de las funciones a, b, c, d.

{- 
(a)
□ ESPECIFICACIÓN:
problema sumatoriaPotenciasDeDos (n:ℕ): ℕ {
requiere: { n ≥ 0}
asegura: { resultado = r ∈ ℕ ⟺ r es la sumatoria de las potenciasde 2 desde cero hasta n }
}▧
-}

--sumatoriaPotenciasDeDos :: Integer -> Integer
--sumatoriaPotenciasDeDos n = 2 * (2^n) - 1

sumatoriaPotenciasDeDos :: Integer -> Integer
sumatoriaPotenciasDeDos 0 = 1
sumatoriaPotenciasDeDos n = 2^(n) + sumatoriaPotenciasDeDos (n - 1)

{-
(b)
□ ESPECIFICACIÓN:
problema sumatoriaPotenciasDeReal (n:ℕ, q:ℝ): ℝ {
requiere: { n ≥ 1}
asegura: { resultado = r ∈ ℝ ⟺ r es la sumatoria de las potencias de q, desde uno hasta n }
}▧
-}

sumatoriaPotenciasDeReal :: Integer -> Float -> Float
sumatoriaPotenciasDeReal 1 q = q
sumatoriaPotenciasDeReal n q = q**(fromIntegral n) + sumatoriaPotenciasDeReal (n - 1) q


{-
(c)
□ ESPECIFICACIÓN:
problema sumatoriaPotenciasDeRealDos (n:ℕ, q:ℝ): ℝ {
requiere: { n ≥ 1}
asegura: { resultado = r ∈ ℝ ⟺ r es la sumatoria de las potencias de q, desde uno hasta 2n }
}▧
-}
--fp :: Integer -> Float -> Float
--fp n q = (q^((2*n) + 1) - q) / (q - 1)

sumatoriaPotenciasDeRealDos :: Integer -> Float -> Float
sumatoriaPotenciasDeRealDos 1 q = q
sumatoriaPotenciasDeRealDos n q = q**(fromIntegral (2*n)) + sumatoriaPotenciasDeReal ((2*n) - 1) q

{-
(d)
□ ESPECIFICACIÓN:
problema sumatoriaPotenciasDeRealTres (n:ℕ, q:ℝ): ℝ {
requiere: { n ≥ 1}
asegura: { resultado = r ∈ ℝ ⟺ r es la sumatoria de las potencias de q, desde n hasta 2n }
}▧
-}
ft :: Integer -> Float -> Float
ft n q = (q^((2*n) + 1) - q^n) / (q - 1) --NO ESTA RESUELTO






-- Ejercicio 11 Especificar e implementar una función eAprox :: Integer -> Float 
-- que aproxime el valor del número e a partir de la siguiente sumatoria:

{-□ ESPECIFICACIÓN:
problema eAprox (n:ℕ): ℝ {
requiere: { n ≥ e}
asegura: { resultado = r ⟺ r se aproxima al número de euler a partir de la sumatoria
           desde 0 hasta n }
}▧
-}

factorial :: Integer -> Integer
factorial 1 = 1
factorial n = n * factorial (n-1)

eAprox :: Integer -> Float 
eAprox 0 = 1
eAprox n = (1 / fromIntegral (factorial n)) + eAprox (n-1)

e :: Float
e = eAprox 10






-- Ejercicio 12
sucesion :: Integer -> Float
sucesion 1 = 2 
sucesion n = 2 + (1 / sucesion (n - 1))

raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = sucesion n - 1






-- Ejercicio 13

{-□ ESPECIFICACIÓN:
problema sumatoriaDeSumatoriaDePotencias (n:ℕ, m:ℕ): ℕ {
requiere: { n, m ≥ 1}
asegura: { resultado = r ⟺ r es la sumatoria desde i=1 hasta n de la sumatoria desde j=1 hasta m, de i^j }
}▧
-}

sumatoriaPotencias :: Integer -> Integer -> Integer
sumatoriaPotencias 1 i = i
sumatoriaPotencias j i = i^(fromIntegral j) + sumatoriaPotencias (j - 1) i

sumatoriaDeSumatoriaDePotencias :: Integer -> Integer -> Integer
sumatoriaDeSumatoriaDePotencias 0 m = 0
sumatoriaDeSumatoriaDePotencias n m = sumatoriaPotencias m n + sumatoriaDeSumatoriaDePotencias (n - 1) m






{-
Ejercicio 14. Especificar e implementar una función sumaPotencias :: Integer ->Integer ->Integer ->Integer que
dados tres naturales q, n, m sume todas las potencias de la forma q a+b con 1 ≤ a ≤ n y 1 ≤ b ≤ m.
□ ESPECIFICACIÓN:
problema sumaPotencias(q:ℕ, n:ℕ, m:ℕ): ℕ {
requiere: { q, n, m ≥ 1}
asegura: { resultado = r ⟺ r es el producto de la sumatoria de potencias de q desde i=1 hasta n,
           por la sumatoria de potencias de q desde i=1 hasta m }
}▧
-}

-- funcion 1
sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q n m = (potenciasDecrecientes q n) * (potenciasDecrecientes q m)

potenciasDecrecientes :: Integer -> Integer -> Integer
potenciasDecrecientes x 1 = x
potenciasDecrecientes x i = (x^i) + (potenciasDecrecientes x (i - 1)) 

-- funcion 2
sumaPotencias2 :: Integer -> Integer -> Integer -> Integer
sumaPotencias2 q 1 m = potenciasDeN2 q 1 m
sumaPotencias2 q n m = potenciasDeN2 q n m + sumaPotencias2 q (n-1) m

potenciasDeN2 q n 1 = (q ^ (n + 1))
potenciasDeN2 q n m = (q ^ (n + m)) + potenciasDeN2 q (n) (m - 1)

-- funcion 3
sumaPotencias3 :: Integer -> Integer -> Integer -> Integer
sumaPotencias3 q n m = sumatoriaPotencias3 n q * sumatoriaPotencias3 m q 

sumatoriaPotencias3 :: Integer -> Integer -> Integer
sumatoriaPotencias3 1 i = i
sumatoriaPotencias3 j i = i^(fromIntegral j) + sumatoriaPotencias3 (j - 1) i






{-Ejercicio 15. Especificar e implementar una función sumaRacionales :: Integer ->Integer ->Float que dados dos
naturales n, m sume todos los números racionales de la forma p/q con 1 ≤ p ≤ n y 1 ≤ q ≤ m.

□ ESPECIFICACIÓN:
problema sumaRacionales(n:ℕ, m:ℕ): ℝ {
requiere: { True }
asegura: { res ⟺ res es la sumatoria desde 1 hasta p, de la sumatoria desde 1 hasta q, de p/q }
}▧
-}

sumaRacionales :: Integer -> Integer -> Float
sumaRacionales 1 q = sumaInterna (fromIntegral 1) (fromIntegral q)
sumaRacionales p q = sumaInterna (fromIntegral p) (fromIntegral q) + sumaRacionales (p - 1) q

sumaInterna :: Float -> Float -> Float
sumaInterna x 1 = x
sumaInterna x i = (x/i) + sumaInterna x (i - 1)




{-
Ejercicio 16. Recordemos que un entero p > 1 es primo si y sólo si no existe un entero k tal que 1 < k < p y k divida a p.

a) Implementar menorDivisor :: Integer ->Integer que calcule el menor divisor (mayor que 1) de un natural n pasado
como parámetro.

b) Implementar la función esPrimo :: Integer ->Bool que indica si un número natural pasado como parámetro es primo.

c) Implementar la función sonCoprimos :: Integer ->Integer ->Bool que dados dos números naturales indica si no
tienen algún divisor en común mayor estricto que 1.

d) Implementar la función nEsimoPrimo :: Integer ->Integer que devuelve el n-ésimo primo (n ≥ 1). Recordar que el
primer primo es el 2, el segundo es el 3, el tercero es el 5, etc.

-}
obtenerDivisor :: Integer -> Integer -> Integer
obtenerDivisor 1 _ = 1
obtenerDivisor p q | q == p = p
                   | (p `mod` q) == 0 = q
                   | (p `mod` q) /= 0 = obtenerDivisor p (q + 1)

menorDivisor :: Integer -> Integer
menorDivisor n = obtenerDivisor n (2)

esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo n = n == menorDivisor n


compararDivisores :: Integer -> Integer -> Integer -> Bool 
compararDivisores x y i | i > x || i > y = True
                        | ((obtenerDivisor x i) == (obtenerDivisor y i)) == False = compararDivisores x y (i + 1)
                        | ((obtenerDivisor x i) == (obtenerDivisor y i)) == True = False

sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos 1 _ = True
sonCoprimos _ 1 = True
sonCoprimos n m = compararDivisores n m 2

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n | esPrimo(n) == True = n
              | esPrimo(n) == False = nEsimoPrimo (n - 1)
              
{-
esEntero :: Float -> Bool
esEntero x = x == fromInteger (round x)

auxPrimo :: Integer -> Integer -> Bool
auxPrimo n i | i > round (sqrt (fromIntegral n)) = True
             | esEntero((sqrt (fromIntegral n) + 1/ fromIntegral i)) == True = False
             | esEntero((sqrt (fromIntegral n) + 1/ fromIntegral i)) == False = auxPrimo n (i + 1)

esPrimo2 1 = False
esPrimo2 n = auxPrimo n 2
-}





{-
Ejercicio 17. Implementar la función esFibonacci :: Integer ->Bool según la siguiente especificación:

problema esFibonacci (n: Z) : B {
requiere: { n ≥ 0 }
asegura: { resultado = true ↔ n es algún valor de la secuencia de Fibonacci definida en el ejercicio 1}
}

-}

evaluarValores :: Integer -> Integer -> Bool
evaluarValores x i | i == (-1) = False
                   | (x == fibonacci i) == False = evaluarValores x (i - 1)
                   | (x == fibonacci i) == True = True

esFibonacci :: Integer -> Bool
esFibonacci n | n == 0 = True
              | n == 1 = True
              | n <= 5 = evaluarValores n (n + 1)
              | otherwise = evaluarValores n n





{-
Ejercicio 18. Implementar una función mayorDigitoPar :: Integer ->Integer según la siguiente especificación:

problema mayorDigitoPar (n: N) : N {
requiere: { True }
asegura: { resultado es el mayor de los dı́gitos pares de n. Si n no tiene ningún dı́gito par, entonces resultado es -1.}
}

-}


esPar :: Integer -> Bool
esPar x = mod x 2 == 0

hastaUltimoPar :: Integer -> Integer
hastaUltimoPar p | (p < 10) && (esPar(p) == False) = -1
                 | (p < 10) && esPar(p) == True = p
                 | esPar(p `mod` 10) == True = p
                 | esPar(p `mod` 10) == False = hastaUltimoPar (p `div` 10)

ultimoPar :: Integer -> Integer
ultimoPar n | hastaUltimoPar n == (-1) = (-1) 
            | hastaUltimoPar n /= (-1) = (hastaUltimoPar n) `mod` 10

reducir :: Integer -> Integer
reducir n | hastaUltimoPar n == (-1) = (-1) 
          | hastaUltimoPar n /= (-1) = (hastaUltimoPar n) `div` 10

cotejar :: Integer -> Integer -> Integer
cotejar par cifras | par == (-1) = (-1)
                   | cifras == (-1) = par
                   | (cifras < 10) && (cifras > par) && (esPar cifras) = cifras
                   | (cifras < 10) && (cifras < par) = par
                   | par == (ultimoPar cifras) = cotejar par (reducir cifras)
                   | par > (ultimoPar cifras) = cotejar par (reducir cifras)
                   | par < (ultimoPar cifras) = cotejar (ultimoPar cifras) (reducir cifras)
                   | otherwise = par

mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n = cotejar (ultimoPar n) (reducir n)





{-
Ejercicio 19. Implementar la funición esSumaInicialDePrimos :: Int ->Bool según la siguiente especificación:
problema esSumaInicialDePrimos (n: Z) : B {
requiere: { n ≥ 0 }
asegura: { resultado = true ↔ n es igual a la suma de los m primeros números primos, para algún m.}
}
-}

obtDivAux :: Int -> Int -> Int
obtDivAux 1 _ = 1
obtDivAux p q | q == p = p
              | (p `mod` q) == 0 = q
              | (p `mod` q) /= 0 = obtDivAux p (q + 1)

minDivAux :: Int -> Int
minDivAux n = obtDivAux n (2)

esPrimoAux :: Int -> Bool
esPrimoAux 1 = False
esPrimoAux n = n == minDivAux n


extraerFactorPrimo :: Int -> Int -> Bool
extraerFactorPrimo numero primo | numero == 0 = True
                                | numero == 1 = extraerFactorPrimo (numero + primo) (siguientePrimo primo)
                                | numero <= -1 = extraerFactorPrimo  (numero + primo) (siguientePrimo primo)  
                                | (esMultiplo (numero - primo) primo) == True = extraerFactorPrimo (numero - primo) primo
                                | (esMultiplo (numero - primo) primo) == False = extraerFactorPrimo numero (siguientePrimo primo)

esMultiplo :: Int -> Int -> Bool
esMultiplo x y = mod x y == 0

siguientePrimo :: Int -> Int
siguientePrimo primo | esPrimoAux(primo + 1) == True = (primo + 1)
                     | esPrimoAux(primo + 1) == False = siguientePrimo(primo + 1)

esSumaInicialDePrimos :: Int -> Bool
esSumaInicialDePrimos n | n <= 1 = False
                        | n <= 3 = True
                        | otherwise = extraerFactorPrimo n 2




{-
Ejercicio 20. Especificar e implementar la función tomaValorMax :: Int ->Int ->Int que dado un número entero n1 ≥ 1
y un n2 ≥ n1 devuelve algún m entre n1 y n2 tal que sumaDivisores(m) = máx{sumaDivisores(i) | n1 ≤ i ≤ n2 }
-}

tomaValorMax :: Integer -> Integer -> Integer
tomaValorMax n m | (n == m) = sumaDivisores(n)
                 | otherwise = max (sumaDivisores (n)) (tomaValorMax (n+1) m)

sumaDivisores :: Integer -> Integer
sumaDivisores n = sumaDivisoresDesde n 1

sumaDivisoresDesde :: Integer -> Integer -> Integer
sumaDivisoresDesde n k | (k == n) = n 
                       | (k < n) && (mod n k == 0) = k + sumaDivisoresDesde n (k+1)
                       | (k > n) = 0
                       | otherwise = sumaDivisoresDesde n (k+1)



{-
Ejercicio 21. Especificar e implementar una función pitagoras :: Integer ->Integer ->Integer ->Integer que dados
m, n , r ∈ N≥0 , cuente cuántos pares (p, q) con 0 ≤ p ≤ m y 0 ≤ q ≤ n satisfacen que p2 + q 2 ≤ r2. Por ejemplo:
pitagoras 3 4 5 -> 20
pitagoras 3 4 2 ->  6
-}

pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras 0 0 _ = 1
pitagoras m n r = contarPares m n r 0 + pitagoras (n-1) (m) r 


contarPares m n r totPares | m < 0 = totPares
                           | (m^2 + n^2 <= r^2) == True = contarPares (m-1) (n) (r) (totPares + 1)
                           | (m^2 + n^2 <= r^2) == False = contarPares (m-1) (n) (r) totPares
