import copy, csv, pprint, random
from queue import LifoQueue as Pila
from queue import Queue as Cola


# RUTAS
ruta_archivo: str = '' #txt
ruta_archivo_2: str = '' #txt
ruta_archivo_binario: str = '' # imagenes, videos, pdfs, etc
ruta_notas: str = '' #csv


# ARCHIVOS
#1.1
def contar_lineas(ruta: str) -> int:
    with open(ruta, 'r', encoding="utf-8") as archivo:
        lineas: list[str] = archivo.readlines()
    return len(lineas)


def contar_lineas_2(archivo: str) -> int: # Resuelto en clase
    a: archivo = open(archivo)
    n: int = 0
    while (a.readline() != ''):
        n += 1
    return n


#1.2
def existe_palabra(palabra: str, ruta: str) -> bool:
    with open(ruta, 'r', encoding="utf-8") as archivo:
        texto: str = archivo.read()
    texto = texto.replace('\n', ' ')
    return (palabra in texto)


#1.3
def cantidad_de_apariciones(ruta: str, palabra: str) -> int:
    with open(ruta, 'r', encoding="utf-8") as archivo:
        texto: str = archivo.read()
    texto = texto.replace('\n', ' ')
    return texto.count(palabra)

def cantidad_de_apariciones_2(ruta: str, palabra: str) -> int:    # Si no se permite utilizar count
    with open(ruta, 'r', encoding="utf-8") as archivo:
        texto: str = archivo.read()
    texto = texto.replace('\n', ' ')
    lista_de_palabras: list[str] = texto.split(' ')
    res: int = 0
    for item in lista_de_palabras:
        if item == palabra:
            res += 1
    return res

#2
def clonar_sin_comentarios(ruta: str) -> None:
    with open(ruta, 'r', encoding="utf-8") as archivo:
        lineas: list[str] = archivo.readlines()
        
    lista_aux: list[str] = []
    for linea in lineas:
        linea_aux: str = linea.strip() 
        if linea_aux == '':
            continue
        if linea_aux[0] == '#':
            continue
        else:
            lista_aux.append(linea)

    lineas_finales: str = '\n'.join(linea for linea in lista_aux)
    archivo = open(f'{ruta[:-4]}_sin_comentarios.txt', 'w', encoding='utf-8')
    archivo.write(lineas_finales)
    archivo.close()


def clonar_sin_comentarios_2(nombre_de_archivo: str) -> None: # Resuelto en clase
    archivo_de_entrada = open(nombre_de_archivo, "r")
    archivo_de_salida = open("nombre_de_otro_archivo", "w")
    cantidad_de_lineas_de_entrada = contar_lineas(nombre_de_archivo)

    while cantidad_de_lineas_de_entrada > 0:
        linea: str = archivo_de_entrada.readline()
        if not es_comentario(linea):
            archivo_de_salida.write(linea)
        cantidad_de_lineas_de_entrada -= 1

    archivo_de_entrada.close()
    archivo_de_salida.close()

def es_comentario(linea: str) -> bool: #AUX Resuelto en clase
    linea2 = linea.strip()
    if len(linea2) == 0:
        return False
    return linea2[0] == '#'

            
         
#3 
def invertir_orden(ruta: str) -> None:
    with open(ruta, 'r', encoding="utf-8") as archivo:
        lineas: list[str] = archivo.readlines()  
    lista_aux: list[str] = []
    conteo: int = len(lineas)
    
    while conteo > 0:
        lista_aux.append(lineas[conteo - 1])
        conteo -= 1 
    
    lineas_finales: str = '\n'.join(linea for linea in lista_aux)
    archivo = open(f'{ruta[:-4]}_reverso', 'w', encoding='utf-8')
    archivo.write(lineas_finales)
    archivo.close()
    
            
#4
def agregar_frase_al_final(ruta: str, frase: str) -> None:
    archivo = open(ruta, 'a', encoding="utf-8")
    archivo.write(frase) 
    
    
#5
def agregar_frase_al_inicio(ruta: str, frase: str) -> None:
    with open(ruta, 'r+', encoding="utf-8") as archivo:
        contenido: str = archivo.read()
        archivo.seek(0,0)
        archivo.truncate(0)
        archivo.write(f'{frase}\n{contenido}') 
        
        
#6
def binario(ruta: str) -> list[str]:
    with open(ruta, 'r+b') as archivo:
        secuencia: bytes = archivo.read()   
    cadena_aux: str = ''
       
    for entero in secuencia:       
        if (entero >= 65 and entero <= 90
            or entero >= 97 and entero <= 122
            or entero == 32
            or entero == 95):
            cadena_aux += chr(entero)
    
    palabras_legibles: list[str] = cadena_aux.split(' ')
    
    return [p for p in palabras_legibles if len(p) >= 5]
          
        
#7
def promedio_estudiante(lu: str) -> float:
    with open(ruta_notas, 'r') as archivo:
        filas = csv.reader(archivo)
        next(filas)
        tabla: list[list] = list(filas)

    lista_aux: list[float] = []
    
    for registro in tabla:
        if registro[0] == lu:
            lista_aux.append(float(registro[3]))
            
    return promedio(lista_aux)
            

def promedio(notas: list[float]) -> float: #AUX
    total: int = 0
    
    for nota in notas:
        total += nota
        
    return round((total / len(notas)), 2)


# PILAS
#8
def generar_numeros_al_azar(n: int, desde: int, hasta: int) -> Pila:
    pila_enteros: Pila[int] = Pila()
    conteo: int = 0
    
    while conteo < n:
        pila_enteros.put(random.randint(desde, hasta))
        conteo += 1
        
    return pila_enteros


#9
def cantidad_elementos_en_pila(p: Pila) -> int:
    lista_aux: list[any] = []
    
    while (p.empty() == False):
        lista_aux.insert(0, p.get())   # Reconstruye la pila agregando los elementos al inicio de la lista
        
    for item in lista_aux:
        p.put(item)
        
    return len(lista_aux)


#10
def buscar_el_maximo_en_pila(p: Pila) -> int:
    lista_aux: list = []
    
    while (p.empty() == False):
        lista_aux.insert(0, p.get())
    for item in lista_aux:
        p.put(item)
        
    return max(lista_aux)

def buscar_el_maximo_en_pila_2(p: Pila) -> int:  # Resuelto en clase
    pila_aux: Pila = Pila()    # En lugar de una lista e insert, utiliza otra pila
    maximo: int = p.get()
    pila_aux.put(maximo)
          
    while not p.empty():
        item: int = p.get()
        pila_aux.put(item)
        if item > maximo:
            maximo = item    
    while not pila_aux.empty():
        p.put(pila_aux.get())
        
    return maximo


#11              
def bien_balanceada(cadena: str) -> bool:
    res: bool = True
    cadena_aux = cadena.replace(' ','')
    pila_aux: Pila = Pila()
    for c in cadena_aux[::-1]:
        pila_aux.put(c)
    pila_aux.get()
    i: int = 0

    while not pila_aux.empty():
        elemento: str = pila_aux.get()
        if (i == 0 and es_operador(cadena_aux[i]) 
            and ord(cadena_aux[i]) != 45):
            res = False
            i += 1
            continue            
        if (pila_aux.empty() and 
            es_operador(elemento)):
            res = False
            continue
        if ((ord(cadena_aux[i]) == 40) and
            ord(elemento) == 45):
            i += 1
            continue              
        if (es_operador(cadena_aux[i]) and
            es_operador(elemento)):
            res = False
            i += 1
            continue
        if (es_operador(cadena_aux[i]) and
            ord(elemento) == 41):
            res = False
            i =+ 1
            continue
        if ((ord(cadena_aux[i]) == 40) and
            es_operador(elemento)):
            res = False
            i =+ 1
            continue
        if ((ord(cadena_aux[i]) == 40) and
            (ord(elemento) == 41)):
            res = False
            i =+ 1
            continue        
        i += 1
        
    return (res and orden_parentesis(cadena)) 

def es_operador(caracter: str) -> bool: #AUX
    res: bool = False
    
    if (ord(caracter) == 42 or
        ord(caracter) == 43 or
        ord(caracter) == 45 or
        ord(caracter) == 47 or
        ord(caracter) == 61):
        res = True
        
    return res

def orden_parentesis(cadena: str) -> bool: #AUX
    computo: int = 0
    
    for caracter in cadena:
        if computo < 0:
            return False
        elif ord(caracter) == 40:
            computo += 1
        elif ord(caracter) == 41:
            computo -= 1
            
    return (computo == 0)


#12
def postfix(cadena) -> int:
    pila_aux: Pila[int] = Pila()
    lista_aux: list[str] = cadena.split(' ')

    for item in lista_aux:
        if item.isnumeric():
            pila_aux.put(item)
        if not item.isnumeric():
            a: int = int(pila_aux.get())
            if pila_aux.empty():
                return 'Expresión incorrecta'
            b: int = int(pila_aux.get())
            if ord(item) == 43:
                pila_aux.put(b + a)
            if ord(item) == 45:
                pila_aux.put(b - a)
            if ord(item) == 42:
                pila_aux.put(b * a)
            if ord(item) == 47:
                pila_aux.put(b / a)
    
    return pila_aux.get()         
             

# COLAS
#13
def cola_de_enteros(n: int = 5, desde: int = 1, hasta: int = 100) -> Cola[int]:
    cola_z: Cola[int] = Cola()
    pila_aux: Pila[int] = generar_numeros_al_azar(n, desde, hasta)

    while n > 0:
        cola_z.put(pila_aux.get())
        n -=1

    return cola_z


#14
def cantidad_elementos_en_cola(c: Cola) -> int:
    lista_aux: list[any] = []
    
    while (c.empty() == False):        
        lista_aux.append(c.get())    # Se reconstruye la cola agregando los elem al final de la lista
    
    for item in lista_aux:
        c.put(item)
        
    return len(lista_aux)


#15
def buscar_el_maximo_en_cola(c: Cola) -> int:
    lista_aux: list = []
    
    while (c.empty() == False):
        lista_aux.append(c.get())
        
    for item in lista_aux:
        c.put(item)
        
    return max(lista_aux)

def buscar_el_maximo_en_cola_2(c: Cola) -> int:
    cola_aux: Cola = Cola()   # En lugar de una lista y append, utiliza otra cola
    maximo: int = c.get()
    cola_aux.put(maximo)   
    
    while not c.empty():
        item: int = c.get()
        cola_aux.put(item)
        if item > maximo:
            maximo = item   
            
    while not cola_aux.empty():
        c.put(cola_aux.get())  
        
    return maximo


#16
def armar_secuencia_de_bingo() -> Cola[int]: #AUX
    lista_aux: list[int] = list(range(100))
    random.shuffle(lista_aux)
    cola_aux: Cola[int] = Cola()
    for item in lista_aux:
        cola_aux.put(item)        
    return cola_aux

def jugar_carton_de_bingo(carton: list[int], bolillero: Cola[int]) -> int:
    jugadas_totales: int = 0
    carton_lleno: int = len(carton)
    cola_aux: Cola[int] = Cola()
    
    while not bolillero.empty():
        bola: int = bolillero.get()
        cola_aux.put(bola)        
        if bola in carton:
            carton_lleno -= 1
        if carton_lleno > 0:
            jugadas_totales += 1
       
    while not cola_aux.empty():
        bola: int = cola_aux.get()
        bolillero.put(bola)
    
    return jugadas_totales


#17
def n_pacientes_urgentes(c: Cola[(int, str, str)]) -> int:
    cola_aux: Cola = Cola()
    n_urgentes: int = 0
    
    while not c.empty():
        paciente: tuple[int, str, str] = c.get()
        cola_aux.put(paciente)
        if paciente[0] in range(1, 4):
            n_urgentes += 1
            
    while not cola_aux.empty():
        c.put(cola_aux.get())
        
    return n_urgentes

def generar_cola_pacientes(n: int = 50) -> Cola[(int, str, str)]: #AUX: genera una cola sintética de pacientes
    cola_pacientes: Cola = Cola()
    lista_prioridades: list[int] = [random.randint(1, 10) for _ in range(n)]
    lista_nombres: list[int] =  [random.randint(97, 122) for _ in range(n)]
    lista_especialidades: list[int] =  [random.randint(65, 80) for _ in range(n)]
    
    while n > 0:
        cola_pacientes.put((lista_prioridades.pop(),
                      (chr(lista_nombres.pop()) * 5),
                      chr(lista_especialidades.pop())))
        n -= 1
        
    return cola_pacientes


#18
def generar_cola_clientes(n: int = 30) -> Cola[(str, int, bool, bool)]: #AUX: genera una cola sintética de clientes
    cola_clientes: Cola = Cola()
    lista_nombres: list[int] = [random.randint(97, 122) for _ in range(n)]
    lista_dni: list[int] = []
    
    for i in range(n):
        lista_aux: list[int] = [random.randint(1, 9) for _ in range(8)]
        cadena_aux: str = ''.join(str(numero) for numero in lista_aux)
        lista_dni.append(int(cadena_aux))
    lista_cuentas: list[int] =  [random.randint(0, 1) for _ in range(n)]
    lista_prioridades: list[int] = [random.randint(0, 1) for _ in range(n)]
    
    while n > 0:
        cola_clientes.put(((chr(lista_nombres.pop()) * 5),
                           lista_dni.pop(),
                           bool(lista_cuentas.pop()),
                           bool(lista_prioridades.pop())))
        n -= 1
    return cola_clientes

def a_clientes(c: Cola[(str, int, bool, bool)]) -> Cola[(str, int, bool, bool)]:
    cola_atencion: Cola[(str, int, bool, bool)] = Cola()
    n: int = cantidad_elementos_en_cola(c)    
    lista_aux: list[(str, int, bool, bool)] = [c.get() for _ in range(n)]   # Respalda la cola original
    re_encolar(c, lista_aux)    
    
    for _ in range(cantidad_elementos_en_cola(c)): # prioridad 1
        cliente = c.get()
        if cliente[3] == True:
            cola_atencion.put(cliente)
        else:
            c.put(cliente)                       
            
    for _ in range(cantidad_elementos_en_cola(c)): # prioridad 2
        cliente = c.get()
        if cliente[2] == True:
            cola_atencion.put(cliente)
        else:
            c.put(cliente)    
            
    while not c.empty():    # resto de clientes
        cola_atencion.put(c.get())
    re_encolar(c, lista_aux)    
    
    return cola_atencion
 
def re_encolar(cola: Cola, lista: list):
    for i in range(len(lista)):
        cola.put(lista[i])
    return cola
        


# DICCIONARIOS
#19
def agrupar_por_longitud(ruta: str) -> dict:
    with open(ruta, 'r', encoding="utf-8") as archivo:
        texto: str = archivo.read()
        
    texto = texto.replace('\n', ' ')
    lista_de_palabras: list[str] = recortar(texto, ' ')
    
    conteo: list[int] = []    
    for item in lista_de_palabras:
        conteo.append(len(item))

    longitudes: dict = {}
    for c in conteo:
        longitudes[c] = contar_ocurrencias(c, conteo)
        borrar_ocurrencias(c, conteo)
    
    return longitudes        
        
def contar_ocurrencias(n: any, lista: list[any]) -> int: #AUX
    return len([z for z in lista if z == n])

def borrar_ocurrencias(e:any, lista: list[any]) -> None: #AUX
    lista = [item for item in lista if item != e]

def recortar(cadena: str, corte: str) -> list[str]: #AUX
    res: list[int] = []                             # Si no se permite utilizar split 
    aux: str = ''                                   # funciona solo para un caracter como referencia para el corte
    for caracter in cadena:
        if caracter != corte:
            aux += caracter
        else:
            cadena = cadena[cadena.find(corte):]
            if aux != '':
                res.append(aux)
            aux = ''
    if aux != '':
        res.append(aux)
    return res

     
    
#20
def promedios_todos() -> dict:
    with open(ruta_notas, 'r') as archivo:
        filas = csv.reader(archivo)
        next(filas)
        tabla: list[list] = list(filas)

    lista_alumnos: list[str] = [] 
    for registro in tabla:
        if registro[0] not in lista_alumnos:
            lista_alumnos.append(registro[0])
    
    res: dict = {}     
    for alumno in lista_alumnos:
        res[alumno] = promedio_estudiante(alumno)
        
    return res


#21
def la_palabra_mas_frecuente(ruta: str) -> str:
    with open(ruta, 'r', encoding="utf-8") as archivo:
        texto: str = archivo.read()
        
    texto = texto.replace('\n', ' ')
    lista_de_palabras: list[str] = recortar(texto, ' ')
    res: str = lista_de_palabras[0]

    dicc_aux: dict = {}    
    for palabra in lista_de_palabras:
        dicc_aux[palabra] = contar_ocurrencias(palabra, lista_de_palabras)
        borrar_ocurrencias(palabra, lista_de_palabras)

    for clave in dicc_aux.keys():
        if dicc_aux[res] < dicc_aux[clave]:
            res = clave
    
    return res
            
       
#22
historiales: dict[str, Pila[str]] = {}
historiales_2: dict[str, Pila[str]] = {}

def visitar_sitio(h: dict, usuario: str, sitio: str) -> None:
    if usuario not in h.keys():
        pila_aux: Pila[str] = Pila()
        h[usuario] = pila_aux
        h[usuario].put(sitio)
    else:
        h[usuario].put(sitio)

def navegar_atras(h: dict, usuario: str) -> None:
    if usuario not in historiales_2.keys():
        pila_aux: Pila[str] = Pila()
        historiales_2[usuario] = pila_aux
        historiales_2[usuario].put(h[usuario].get())
    else:
        h[usuario].put(h[usuario].get)
        
def navegar_adelante(h: dict, usuario: str) -> None:
    h[usuario].put(historiales_2[usuario].get())
    
    

#23
inventario: dict = {}

def agregar_producto(inv: dict, nombre: str, precio: float, cantidad: int) -> None:
    if nombre in inv.keys():
        pass
    else: 
        inv[nombre] = {'precio':precio, 'cantidad': cantidad}
        
def actualizar_stock(inv: dict, nombre: str, cantidad: int) -> None:
    if nombre not in inv.keys():
        pass
    else:
        inv[nombre]['cantidad'] = cantidad
        
def actualizar_precio(inv: dict, nombre: str, precio: float) -> None:
    if nombre not in inv.keys():
        pass
    else:
        inv[nombre]['precio'] = precio

def calcular_valor_inventario(inv: dict) -> float:
    total: float = 0
    for clave in inv.keys():
        total += inv[clave]['cantidad'] * inv[clave]['precio']
    return total
        



# PRUEBAS

# ARCHIVOS

#print(contar_lineas(ruta_archivo))

#print(existe_palabra('prueba', ruta_archivo))

#print(cantidad_de_apariciones(ruta_archivo, 'prueba'))
#print(cantidad_de_apariciones_2(ruta_archivo, 'nada'))

#clonar_sin_comentarios(ruta_archivo_2)

#invertir_orden(ruta_archivo)

#agregar_frase_al_final(ruta_archivo, '\nfrase en nueva linea que se agrega al final')
#agregar_frase_al_inicio(ruta_archivo, 'otra frase que se agrega al inicio')

#a = binario(ruta_archivo_binario)
#pprint.pprint(a[:500])

#print(promedio_estudiante('3333/33'))



#PILAS

#p = generar_numeros_al_azar(10, 23, 79)
#for i in range(10):
#    print(p.get())
#print(p.empty())
#pila_prueba = generar_numeros_al_azar(10, 23, 79)
#print(pila_prueba.qsize())

#x = cantidad_elementos_en_pila(pila_prueba)
#print(x)
#print(pila_prueba.qsize())

#print(buscar_el_maximo_en_pila(pila_prueba))
#print(buscar_el_maximo_en_pila_2(pila_prueba))

#print(bien_balanceada('(5)+(4-(-9*(8/8))) = (7)'))

#print(postfix('3 4 + 5 6 - *'))



#COLAS

#a = cola_de_enteros()
#print(a.queue)
#print(a.get())

#cola_prueba = cola_de_enteros(10)
#print(cantidad_elementos_en_cola(cola_prueba))

#print(buscar_el_maximo_en_cola(cola_prueba))
#print(buscar_el_maximo_en_cola_2(cola_prueba))
#print(cola_prueba.queue)

#cola_bingo = armar_secuencia_de_bingo()
#carton_bingo = [random.randint(0, 99) for _ in range(12)]
#print(jugar_carton_de_bingo(carton_bingo, cola_bingo))

#cola_pacientes = generar_cola_pacientes()
#print(n_pacientes_urgentes(cola_pacientes))

#cola_clientes = generar_cola_clientes()
#print('original')
#pprint.pprint(cola_clientes.queue)
#print('atencion')
#pprint.pprint(a_clientes(cola_clientes).queue)
#print('post')
#pprint.pprint(cola_clientes.queue)



# DICCIONARIOS

#print(agrupar_por_longitud(ruta_archivo))

#print(promedios_todos())

#print(la_palabra_mas_frecuente(ruta_archivo))

#visitar_sitio(historiales, "Usuario1", "sitio1.com.ar")
#visitar_sitio(historiales, "Usuario1", "sitio2.com.ar")
#navegar_atras(historiales, "Usuario1")
#visitar_sitio(historiales, "Usuario2", "sitio3.com.ar")
#navegar_adelante(historiales, "Usuario1")

#agregar_producto(inventario, "Camisa", 20.0, 50)
#agregar_producto(inventario, "Pantalón", 30.0, 30)
#actualizar_stock(inventario, "Camisa", 10)
#valor_total = calcular_valor_inventario(inventario)
#print("Valor total del inventario:", valor_total)
#print(inventario)