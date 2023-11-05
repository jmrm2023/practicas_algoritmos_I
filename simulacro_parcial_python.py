
#E1
def ultima_aparicion(s: list, e: int) -> int:
    res : int = 0
    i: int = len(s) - 1
    condicion: bool = True
    
    while condicion:
        if s[i] == e:
            res = i
            condicion = False
        i -= 1
    return res

#E2
def elementos_exclusivos(s: list, t: list) -> list:
    res: list = []
    for z in s:
        if (z not in t and
            z not in res):
            res.append(z)
    for z in t:
        if (z not in s and
            z not in res):
            res.append(z)
    return res

#E3
def contar_traducciones_iguales(ingles: dict, aleman: dict) -> int:
    res: int = 0
    for palabra in ingles.keys():
        if (palabra in aleman.keys() and
            ingles[palabra] == aleman[palabra]):
            res += 1
    return res

#E4
def convertir_a_diccionario(lista: list) -> dict:
    res: dict = dict()
    for z in lista:
        res[z] = contar_ocurrencias(lista, z)
    return res


def contar_ocurrencias(l: list, e: any) -> int: #AUX
    res = 0
    for item in l:
        if item == e:
            res += 1
    return res
