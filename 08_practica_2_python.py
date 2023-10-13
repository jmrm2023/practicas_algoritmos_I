import random
import numpy as np

#PARTE I

#P1_E-1
def pertenece(s:list[int], e) -> bool:
    return e in s

def pertenece_2(s:list[int], e:int) -> bool:
    res:bool = False
    for i in range(len(s)):
        if s[i] == e:
            res = True       
    return res

def pertenece_3(s:list[int], e:int) -> bool:
    res:bool = False
    i:int = 0
    while i < len(s):
        if res == True:
            return res
        res = (s[i] == e)
        i+=1
    return res


#P1_E-2
def divideATodos(s:list[int], e:int)->bool:
    res:bool = True
    for i in range(len(s)):
        if s[i] % e == 0:
            continue
        else:
            res = False
    return res


#P1_E-3
def sumaTotal(s:list[int]) -> int:
    res:int = 0
    for i in range(len(s)):
        res += s[i]
    return res


#P1_E-4
def ordenados(s:list[int]) -> bool:
    res:bool = True
    for i in range(len(s)):
        if i == 0:
            continue
        if s[i-1] < s[i]:
            continue
        else:
            res = False
    return res
    

#P1_E-5
def mayorASiete(listaPalabras:list[str]) -> bool:
    res:bool = False
    for palabra in listaPalabras:
        if len(palabra) > 7:
            res = True
    return res
    


#P1_E-6
def palindromo(texto:str)-> bool:
    texto_original:str = texto.lower().replace(' ','')
    i:int = len(texto_original)
    texto_al_reves:str = ''
    while i > 0:
        texto_al_reves += texto_original[i-1]
        i-=1
    return texto_original == texto_al_reves


#P1_E-7
def tieneMinusculas(palabra:str) -> bool:  #AUX
    res = False
    for letra in palabra:
        if letra.islower():
            res = True
    return res

#60 <= ord('caracter') <= 90   <---- ASCII
def tieneMayusculas(palabra:str) -> bool:  #AUX
    res = False
    for letra in palabra:
        if letra.isupper():
            res = True
    return res

def tieneNumeros(palabra:str) -> bool:  #AUX
    res = False
    for letra in palabra:
        if letra.isnumeric():
            res = True
    return res

def fortalezaClave(clave:str) -> str:
    res:str = ''
    if (tieneMinusculas(clave) and 
        tieneMayusculas(clave) and
        tieneNumeros(clave) and
        len(clave) > 8):
        res = 'VERDE'
    elif (len(clave) < 5):
        res = 'ROJA'
    else:
        res = 'AMARILLA'
    return res

#P1_E-8
def saldo(transacciones:list[tuple[str, int]]) -> int:
    res:int = 0
    for movimiento in transacciones:
        if movimiento[0] == 'I':
            res += movimiento[1]
        elif movimiento[0] == 'R':
            res -= movimiento[1]
    return res

#P1_E-9
def tieneVocales(texto:str) -> bool:
    vocales:str = 'aeiouAEIOUáéíóúÁÉÍÓÚ'
    lista_de_vocales:list[str] = []
    for letra in texto:
        if (letra in vocales and not 
            letra in lista_de_vocales):
            lista_de_vocales.append(letra)
    return (len(lista_de_vocales) >= 3)
    


#PARTE II

#P2_E-1
def borrarPares(s:list[int]) -> list[int]:
    for i in range(1, len(s), 2):
        s[i] = 0
    return s

#P2_E-2
def borrarPares_2(s:list[int]) -> list[int]:
    lista_final:list[int] = []
    for i in range(len(s)):
        if (i % 2 == 0):
            lista_final.append(s[i])
        else:
            lista_final.append(0)
    return lista_final

#P2_E-3
def sinVocales(texto:str)-> str:
    vocales:str = 'aeiouAEIOUáéíóúÁÉÍÓÚ'
    cadena_salida:str = ''
    for letra in texto:
        if letra in vocales:
            continue
        cadena_salida += letra
    return cadena_salida

#P2_E-4
def reemplazaVocales(texto:str) -> str:
    vocales:str = 'aeiouAEIOUáéíóúÁÉÍÓÚ'
    cadena_salida:str = ''
    for letra in texto:
        if letra in vocales:
            cadena_salida += '-'
            continue
        cadena_salida += letra
    return cadena_salida

#P2_E-5
def daVuelta(texto:str) -> str:
    i:int = len(texto)
    texto_al_reves:str = ''
    while i > 0:
        texto_al_reves += texto[i-1]
        i-=1
    return texto_al_reves


#P2_E-6
def eliminarRepetidos(texto: str) -> str:
    texto_nuevo:str = ''
    for caracter in texto:
        if caracter == ' ':
            texto_nuevo += caracter
        if (caracter not in texto_nuevo):
            texto_nuevo += caracter
    return texto_nuevo


#P2_E-7
def promedio(notas:list[int]) -> float: #AUX
    total:int = 0
    for nota in notas:
        total += nota
    return (total / len(notas))

def todasMasDeCuatro(notas:list[int]) -> bool: #AUX
    res:bool = True
    for nota in notas:
        if nota < 4:
            res = False
    return res


def aprobado(notas:list[int]) -> int:
    res:bool = 0
    if (todasMasDeCuatro(notas) and
        promedio(notas) >= 7):
        res = 1
    if (todasMasDeCuatro(notas) and
        promedio(notas) < 7 and
        promedio(notas) >= 4):
        res = 2
    if ((not todasMasDeCuatro(notas)) or
        promedio(notas) < 4):
        res = 3
    return res


#P2_E-8
def ingresarNombre() -> list[str]:
    print('Ingresar nombres. Para finalizar ingresar "listo":')
    lista_final:list[str] = []
    while 'listo' not in lista_final:
        lista_final.append(input())
    return lista_final[:-1]


#P2_E-9
def monedero() -> list[tuple[str, int]]:
    movimientos:list[tuple[str, int]] = []
    condicion:bool = True
    while condicion:
        print('Para operar, ingrese:\n "C" para cargar créditos\n "D" para descontar créditos\n "X" para salir')
        entrada:str = input()
        if entrada == 'C':
            print('Ingresar monto a cargar:')
            movimientos.append(('C', input()))
            print('La operación fue exitosa.')
        if entrada == 'D':
            print('Ingresar monto a descontar:')
            movimientos.append(('D', input()))
            print('La operación fue exitosa.')
        if entrada == 'X':
            condicion = False
    return movimientos

#P2_E-10
def juego() -> list[int]:
    condicion:bool = True
    cartas:list[int] = []
    total:float = 0
    print('Empezó el juego! Se preguntará si desea seguir sacando cartas. Si la suma de las cartas es mayor a 7.5 pierde:')
    while condicion:
        if total > 7.5:
            print(f'Perdiste. tus cartas suman {total}.')
            condicion = False
        print('Sacar una carta? "SI" o "NO"')
        entrada:str = input()
        if entrada == 'SI':
            carta:int = random.randint(1,12)
            if carta == 8 or carta == 9:
                carta = random.randint(1,12)
            cartas.append(carta)
            if (carta == 10 or 
                carta == 11 or
                carta == 12):
                total += 0.5
            else:
                total += carta
        if entrada == 'NO':
            condicion = False
        if total > 7.5:
            print(f'Perdiste. tus cartas suman {total}.')
            condicion = False
    return cartas



#P2_E-11
def perteneceACadaUno(s:list[list[int]], e:int) -> list[bool]:
    res:list[bool] = []
    for i in range(len(s)):
        if pertenece(s[i], e):
            res.append(True)
        else: 
            res.append(False)
    return res


#P2_E-12
def esMatriz(s:list[list[int]]) -> bool:
    res:bool = True
    if len(s) == 0:
        res == False
    try:
        if len(s[0]) == 0:
            res = False
    except:
        res = False
    try:
        longitud:int = len(s[0])
        for i in range(len(s)):
            if len(s[i]) != longitud:
                res = False
    except:
        res = False
    return res

#P2_E-13
def filasOrdenadas(m:list[list[int]]) -> list[bool]:
    res: list[bool] = []
    for i in range(len(m)):
        res.append(ordenados(m[i]))
    return res


#P2_E.5.4
def elevarMatriz(d:int, p:int) -> np.array:
    m:np.array = np.random.randint(1,5, (d, d))
    res:np.array = m.copy()
    print('matriz original:\n', m)
    if p==0:
        for i in range(len(m)):
            for j in range(len(m[i])):
                if j==i:
                    res[i][j] = 1
                else:
                    res[i][j] = 0
    while (p-1) > 0:
        res = productoDeMatrices(res, m)
        p-=1        
    return res

def productoDeMatrices(m:np.array, n:np.array) -> np.array:   #AUX
    res:np.array = m.copy()
    for i in range(len(m)):
        for j in range(len(m[i])):
            vector_aux:np.array = n[:,j]
            res[i][j] = productoEscalar(m[i], vector_aux)
    return res    
            
def productoEscalar(u:np.array, v:np.array) -> int: #AUX
    res:int = 0
    for i in range(len(u)):
        res += u[i]*v[i]
    return res


