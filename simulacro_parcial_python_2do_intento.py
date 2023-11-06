

def ultima_aparicion(s: list, e: int) -> int:
    res:int=0 
    for i in range(len(s)):
        if s[i] == e and i > res:
            res = i
    return res


def elementos_exclusivos(s: list, t: list) -> list:
    res: list[int] = []
    for item in s:
        if item not in t and item not in res:
            res.append(item)
    for item in t:
        if item not in s and item not in res:
            res.append(item)            
    return res
    

def contar_traducciones_iguales(ingles: dict, aleman: dict) -> int:
    conteo:int = 0
    for clave in ingles.keys():
        if ingles[clave] == aleman[clave]:
            conteo += 1
    return conteo
    

def convertir_a_diccionario(lista: list) -> dict:
    res:dict[int, int] = dict()
    for item in lista:
        res[item] = ocurrencias(item, lista)
    return res

def ocurrencias(e:int, l:list[int]) ->int: #AUX
    res:int = 0
    for item in l:
        if item == e:
            res += 1
    return res
