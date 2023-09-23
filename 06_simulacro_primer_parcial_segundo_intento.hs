import Test.HUnit


--(1)
primeraComponente :: (a, b) -> a
primeraComponente (a, _) = a

segundaComponente :: (a, b) -> b
segundaComponente (_,b) = b

cambiarPosicion :: (a, b) -> (b, a)
cambiarPosicion (a, b) = (b, a)

sonIgualesSinOrden :: Eq(t) => (t, t) -> (t, t) -> Bool
sonIgualesSinOrden (a, b) (c, d) | (a == c) && (b == d) = True
                                 | (a == d) && (b == c) = True
                                 | otherwise = False  

componentesIguales :: Eq(t) => (t, t) -> Bool
componentesIguales tupla = primeraComponente tupla == segundaComponente tupla

pertenece :: Eq(t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs) | e == x = True
                   | e /= x = pertenece e xs
                   | otherwise = False

relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas (x:xs) | not (pertenece x xs) && not (pertenece (cambiarPosicion x) xs) && not (componentesIguales x) = relacionesValidas xs
                         | otherwise = False


--(2)
agruparElementos :: [(t, t)] -> [t]
agruparElementos [] = []
agruparElementos ((a, b):xs) = a:b:[] ++ agruparElementos xs

filtrarRepetidos :: Eq(t) => [t] -> [t]
filtrarRepetidos [] = []
filtrarRepetidos (x:xs) | pertenece x xs = [] ++ filtrarRepetidos xs
                        | not (pertenece x xs) = x:[] ++ filtrarRepetidos xs

personas :: [(String, String)] -> [(String)]
personas relaciones = filtrarRepetidos (agruparElementos relaciones) 


--(3)
amigosDe :: String -> [(String, String)] -> [String]
amigosDe _ [] = []
amigosDe c ((a, b):xs) | c == a = [b] ++ amigosDe c xs
                       | c == b = [a] ++ amigosDe c xs
                       | otherwise = amigosDe c xs


--(4)
contarElementos :: Eq(t) => t -> [t] -> Integer -> Integer
contarElementos _ [] i = i
contarElementos e (x:xs) i | e == x = contarElementos e xs (i+1)
                           | otherwise = contarElementos e xs  i

conMasAmigos :: [String] -> String -> Integer -> String 
conMasAmigos [] nombre cantAmigos = nombre
conMasAmigos (x:xs) nombre cantAmigos | (contarElementos x xs 0) > cantAmigos = conMasAmigos xs x (contarElementos x xs 0)
                                    | (contarElementos x xs 0) < cantAmigos = conMasAmigos xs nombre cantAmigos
                                    | (contarElementos x xs 0) == cantAmigos = conMasAmigos xs x (contarElementos x xs 0)

personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos [] = []
personaConMasAmigos relaciones = conMasAmigos (agruparElementos relaciones) (primeraComponente (head relaciones)) 0



--(Testing)

listaDeCasos = test [
    "relación válida: vacía" ~: (relacionesValidas relacion0) ~?= True,
    "relación válida: par único" ~: (relacionesValidas [relacion1]) ~?= True,
    "relacion valida: todos distintos" ~: (relacionesValidas relacion2) ~?= True,
    "relacion invalida: ≠ orden" ~: (relacionesValidas relacion3) ~?= False,
    "relacion invalida: = orden" ~: (relacionesValidas relacion4) ~?= False,
    "relacion invalida: componente repetida" ~: (relacionesValidas relacion5) ~?= False,
    "relacion invalida: par repetido" ~: (relacionesValidas [relacion6]) ~?= False ]

relacion0 = []
relacion1 = ("Juan", "Pedro")
relacion2 = [("Juan", "Pedro"), ("Julia", "Pablo"), ("Jose", "Pepe")]
relacion3 = [("Jose", "Pepe"), ("Julia", "Pablo"), ("Pepe", "Jose")]
relacion4 = [("Jose", "Pepe"), ("Julia", "Pablo"), ("Jose", "Pepe")]
relacion5 = [("Jose", "Pepe"), ("Julia", "Julia"), ("Jose", "Pepe")]
relacion6 = ("Pedro", "Pedro")

