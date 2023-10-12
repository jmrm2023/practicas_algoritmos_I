import math


#E1-1
def imprimir_hola_mundo () -> str:
    print('Ejercicio1_1:\n','hola mundo')

#E1-2
def imprimir_un_verso() -> str:
    print('Ejercicio1_2:\n','linea 1\nlinea 2\nlinea 3\nlinea 4')

#E1-3
def raiz_de(n: int) -> float:
    return round(math.sqrt(n), 4)

#E1-4
def factorial_de(n: int) -> int:
    return math.factorial(n)

#E1-5
def perimetro(radio: int) -> float:
    return 2 * math.pi * radio

#E2-1
def imprimir_saludo(nombre: str) -> str:
    print(f'Hola {nombre}')

#E2-2
#raiz

#E2-3
def fahrenheit_a_celsius(t: float) -> float:
    return ((t - 32)*5)/9

#E2-4
def imprimir_dos_veces(estribillo: str) -> str:
    print(estribillo * 2)

#E2-5
def es_multiplo_de(n: int, m: int)-> bool:
    return (n % m) == 0

#E2-6
def es_par(n: int) -> bool:
    return es_multiplo_de(n, 2)

#E2-7
def cantidad_de_pizzas(comensales: int, min_porciones: int) -> int:
    if (comensales * min_porciones) % 8 == 0:
        return ((comensales * min_porciones) // 8)
    else:
        return (((comensales * min_porciones) // 8) + 1)

#E3-1
def alguno_es_0(n1: float, n2: float) -> bool:
    return (n1 == 0 or n2 == 0)

#E3-2
def ambos_son_0(n1: float, n2: float) -> bool:
    return (n1 == 0 and n1 == 0) 

#E3-3
def es_nombre_largo(nombre: str) -> bool:
    return (len(nombre) >= 3 and len(nombre) <= 8) 

#E3-4
def es_bisiesto(año: int) -> bool:
    return es_multiplo_de(año, 400) or (es_multiplo_de(año, 4) and not es_multiplo_de(año, 100))

#E4-1
def peso_pino(altura:int)-> int:
    if altura <= 3:
        return (altura * 100 * 3)
    else:
        return (900 + (altura - 3) * 100 * 2)

def es_peso_util(peso:int) -> bool:
    return peso >= 400 and peso <= 1000

def sirve_pino(altura: int) -> bool:
    return es_peso_util(peso_pino(altura))

#E5-1
def devolver_el_doble_si_es_par(numero: int) -> int:
    if es_par(numero):
        return numero * 2
    else:
        return numero

#E5-2    
def devolver_valor_si_es_par_sino_el_que_sigue(numero: int) -> int:
    if es_par(numero):
        return numero
    else:
        return numero + 1

#E5-3
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero: int) -> int:
    if es_multiplo_de(numero, 9):
        res = numero * 3
    elif es_multiplo_de(numero, 3):
        res = numero * 2
    else:
        res = numero
    return res

#E5-4
def lindo_nombre(nombre: str) -> str:
    if len(nombre) >= 5:
        res = 'Tu nombre tiene muchas letras!'
    else:
        res = 'Tu nombre tiene menos de 5 caracteres'
    return res

#E5-5
def el_rango(numero:int) -> str:
    if numero < 5:
        res = 'Menor a 5'
    elif numero >= 10 and numero <= 20:
        res = 'Entre 10 y 20'
    elif numero > 20:
        res = 'Mayor a 20'
    else:
        res = 'otro'
    return res

#E5-6
def laburo(sexo: str, edad: int) -> str:
    if edad < 18:
        res = 'Andá de vacaciones'
    elif (edad >= 18) and (edad < 60) and (sexo == 'F'):
        res = 'Te toca trabajar'
    elif (edad >= 18) and (edad < 65) and (sexo == 'M'):
        res = 'Te toca trabajar'
    else:
        res = 'Andá de vacaciones'
    return res

#E6-1
def uno_diez():
    cont = 0
    while cont < 10:
        print(cont + 1)
        cont += 1
#E7-1        
def uno_diez_for():
   for i in range(10):
       print(i+1)

#E6-2
def pares_10_40() -> int:
    cont = 9
    while cont < 41:
        if es_par(cont):
            print(cont)
        cont += 1

#E7-2
def pares_10_40_for():
    for i in range(10, 41, 2):
        print(i)

#E6-3
def eco():
    cont = 0
    while cont < 10:
        print('eco ')
        cont += 1

#E7-3
def eco_for():
    for i in range(10):
        print('eco')

#E6-4
def cuenta_regresiva(n: int):
    while n >= 1:
        print(n)
        n -= 1
    print('Despegue!')

#E7-4
def cuenta_regresiva_for(n: int):
    for i in range(n):
        print(n-i)
    print('Despegue!')


#E6-5
def viaje_tiempo(partida: int, llegada: int):
    while partida > llegada + 1:
        partida -= 1
        print(f'Viajó un año al pasado, estamos en el año: {partida}')      
    print(f'Llegaste al año {llegada}!')

#E7-5
def viaje_tiempo_for(partida: int, llegada: int):
    for i in range(llegada, partida):
        print(f'Viajó un año al pasado, estamos en el año: {(partida-1) - i + llegada}')      
    print(f'Llegaste al año {llegada}!')

#E6-6
def monitoreo_viaje_tiempo(partida:int):
    while partida > -384 + 20:
        partida -= 20
        print(f'Viajó veinte años al pasado, estamos en el año: {partida}')
    print(f'Llegaste al año {partida} a.C., podes concer a Aristóteles!')

#E7-6
def monitoreo_viaje_tiempo_for(partida:int):
    for i in range(0, partida + 384, 20):
        if i <= 1:
            next
        else:
            print(f'Viajó veinte años al pasado, estamos en el año: {partida - i}')
    print(f'Llegaste al año {partida} a.C., podes conocer a Aristóteles!')


