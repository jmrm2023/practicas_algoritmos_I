import math, pprint



# E-1 Función que calcula con qué signo del horoscopo chino
# se corresponde el año ingresado
def congruentes(a:int, b:int, m:int) -> bool: #AUX
    return (a % m) == (b % m)

def signo() -> dict[int, str]: #AUX
    d:dict = dict()
    signos:list[str] = ['Mono','Gallo', 'Perro', 'Cerdo', 'Rata', 'Buey', 'Tigre',
                        'Conejo', 'Dragón', 'Serpiente', 'Caballo', 'Cabra']
    for i in range(len(signos)):
        d[i] = signos[i]
    return d

def calendario_chino(n:int) -> str:
    for i in range(12):
        if congruentes(n, i, 12):
            return signo()[i]                      




# E-2 Función que retorna las raíces en R de una cuadrática
def resolvente(a:int, b:int, c:int):
    discriminante:int = (b**2) - (4*a*c)
    res:str = ""
    
    if discriminante > 0:
        res_1:float = (-b + math.sqrt(discriminante)) / 2*a
        res_2:float = (-b - math.sqrt(discriminante)) / 2*a
        res += f"Las raíces son {str(round(res_1, 2))} y {str(round(res_2, 2))}"
        
    elif discriminante == 0:
        res_1 = (-b / 2*a)
        res += f"La raíz es {str(round(res_1, 2))}"
        
    else:
        res += "No tiene solución en R"
    
    return res
        



# E-3 Función que genera la Criba de Eratostenes
def criba_eratostenes(n:int) -> list[int]:
    lista_aux:list[int] = list(range(n + 1))
    lista_aux = lista_aux[2:]
    for a in lista_aux:
        for b in lista_aux:
            if a == b:
                continue
            elif b % a == 0:
                lista_aux.remove(b)
    return lista_aux




# E-4 Funciones que aplican el cifrado César
# Recibe como argumento la ruta a un txt
# y una clave c tal que 1 ⩽ c < 26
def cifrado_cesar(ruta:str, clave:int) -> None:
    with open(ruta, 'r') as archivo:
        contenido = archivo.read()
    lista_de_caracteres: list[str] = [c for c in contenido]
    
    lista_aux: list[str] = []
    for caracter in lista_de_caracteres:
        x:int = ord(caracter)
        if (x >= 65 and x <= 90):
            x += clave
            if x > 90:
                x = 64 + (x % 90)
                lista_aux.append(chr(x))
            else:
                lista_aux.append(chr(x))
        
        elif (x >= 97 and x <= 122):
            x += clave
            if x > 122:
                x = 96 + (x % 122)
                lista_aux.append(chr(x))
            else:
                lista_aux.append(chr(x))
        
        else:
            lista_aux.append(chr(x))
    
    texto_aux:str = ''.join(lista_aux)
    with open(f'{ruta[:-4]}_cifrado.txt', 'w') as archivo:
        archivo.write(texto_aux)
        
        
# Recibe como argumento la ruta al texto cifrado
# y la clave con la que fué cifrado
def descifrado_cesar(ruta:str, clave:int) -> None:
    with open(ruta, 'r') as archivo:
        contenido = archivo.read()
    lista_de_caracteres: list[str] = [c for c in contenido]
    
    lista_aux: list[str] = []
    for caracter in lista_de_caracteres:
        x:int = ord(caracter)
        if (x >= 65 and x <= 90):
            x -= clave
            if x < 65:
                x = 91 - (65 % x)
                lista_aux.append(chr(x))
            else:
                lista_aux.append(chr(x))
        
        elif (x >= 97 and x <= 122):
            x -= clave
            if x < 97:
                x = 123 - (97 % x)
                lista_aux.append(chr(x))
            else:
                lista_aux.append(chr(x))
        
        else:
            lista_aux.append(chr(x))
    
    texto_aux:str = ''.join(lista_aux)
    with open(f'{ruta[:-4]}_descifrado.txt', 'w') as archivo:
        archivo.write(texto_aux)     
    



# E-5 Función que aplica el algoritmo de Euclides y retorna el mcd(a, b)
def euclides(a:int, b:int):
    par: list[int] = [a, b]
    while min(par) > 0:
        par[par.index(max(par))] = max(par) - min(par)
    return max(par)

# Otra implementación del algoritmo de Euclides
def euclides_2(a:int, b:int):
    par: list[int] = [a, b]
    while min(par) > 0:
        cociente = max(par) // min(par)    
        par[par.index(max(par))] = max(par) - min(par) * cociente
    return max(par)




# E-6 Función que encuentra los coeficientes s, t
# de la Identidad de Bézout: si x⊥y ⟹ (x:y) = 1 = s·x + t·y
def bezout(x:int, y:int) -> str:    
    par:list[int] = [x, y]
    s:int = 1
    t:int = 0    
    divisor_s:int = 0
    divisor_t:int = 1
    lista_aux:list[tuple[int]] = []
    
    # Euclides
    while min(par) > 0:        
        cociente:int = max(par) // min(par)                                     
        par[par.index(max(par))] = max(par) - min(par) * cociente
                
        # Cuenta clave
        resto_s:int = s - cociente * divisor_s
        resto_t:int = t - cociente * divisor_t        
        # Sustitución de valores
        s = divisor_s
        divisor_s = resto_s
        t = divisor_t        
        divisor_t = resto_t
        # Consevr
        lista_aux.append((s, t))

    res:str =f'(±{max(abs(s), abs(t))})·{min(x, y)}  ±  ({min(abs(s), abs(t))})·{max(x, y)}  =  {max(par)}'                     
    return res



# E-7 Función que convierte una cadena de carcateres a código Morse
def c_m() -> dict[str, str]: #AUX
    d:dict[str, str] = dict()
    l:list[str] = ['.-','-..','-.-.','-..','.','..-.','--.','....','..','.---','-.-','.-..','--',
                   '-.','---','.--.','--.-','.-.','...','-','..-','...-','.--','-..-','-.--','--..']
    n:list[str] = ['------','.----','..---','...--','....-','.....','-....','--...','---..','----.']
    
    x:int = 97
    for i in range(len(l)):
        d[chr(x+i)] = l[i]
    
    x = 48
    for i in range(len(n)):
        d[chr(x+i)] = n[i]
    
    return d

def texto_a_morse(t:str) -> str:
    t = t.lower()
    res:str = ''
    morse:dict[str, str] = c_m()
    for c in t:
        if c == ' ':
            res += c*2
        elif c not in morse.keys():
            continue
        else:        
            res += f'{morse[c]} '
    return res
