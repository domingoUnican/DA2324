import sys
import timeit


def p(n):
    """Calcula el número de particiones
    de n.
    """
    return p_act(n, n)
def p_act(n, k):
    """Calcula el número de particiones
    de n con longitud acotada por k.
    """
    if n == k == 0:
        return 1
    elif n >= 0 and k >= 1:
        return p_act(n, k - 1)\
            + p_act(n - k, k)
    else:
        return 0

def p2(n):
    """Calcula el número de particiones
    de n.
    """
    return p_act2(n, n)

def p_act2(n, k):
    if n == k == 0:
        return 1
    elif n >= 0 and k >= 1:
        if n == 0 or k == 1:
             return 1
        elif k > n:
            return p_act2(n, n)
        else:
            return p_act2(n, k - 1) + p_act2(n - k, k)
    else:
        return 0


def p3(n):
    """Calcula el número de particiones de n."""
    tabla = [[0] * (n + 1) for x in range(n + 1)]  
    return p_act3(n, n, tabla)

def p_act3(n, k, tabla):
    """Calcula el número de particiones de n con longitud acotada por k."""
    if n == k == 0: #caso base
        return 1
    elif n >= 0 and k >= 1: #si no
        if tabla[n][k] != 0:
            return tabla[n][k]
        tabla[n][k] = p_act3(n, k - 1, tabla) + p_act3(n - k, k, tabla)
        return tabla[n][k]
    else:
        return 0


def p_bottom_up(n):
    """Calcula el número de particiones de n utilizando un enfoque bottom-up"""
    tabla = [[0] * (n + 1) for _ in range(n + 1)]

    for i in range(n + 1):
        tabla[i][0] = 1  # Caso base: una manera de sumar a 0

    for i in range(1, n + 1): #i representa k 
        for j in range(1, n + 1): #j representa n
            if j >= i:
                tabla[i][j] = tabla[i - 1][j] + tabla[i][j - i]
            else:
                tabla[i][j] = tabla[i - 1][j]

    return tabla[n][n]

"Algoritmo de sage, Ejercicio4"
#Partitions(5).cardinality() 
#SageMath utiliza estructuras de datos, y formulas avanzadas para calcular el número de particiones.
#Nuestra forma eficiente de caluclar la particion esta bien, pero sigue necesitando muchos calculos.



if __name__ == '__main__':

    if len(sys.argv) > 1:
        n = int(sys.argv[1])
        #print('p(%d) = %d' % (n, p(n)))
        #print('p(%d) = %d' % (n,p2(n)))
        #print('p(%d) = %d' % (n,p3(n)))
        print('p(%d) = %d' % (n,p_bottom_up(n)))
       

        
        #tiempo1 = timeit.timeit(lambda: p(n), number=1)
        #tiempo2 = timeit.timeit(lambda: p2(n), number=1)
        #tiempo3 = timeit.timeit(lambda: p3(n), number=1)
        tiempo4 = timeit.timeit(lambda: p_bottom_up(n), number=1)

        #print(f'Tiempo de ejecución: {tiempo1:.6f} segundos')
        #print(f'Tiempo de ejecución: {tiempo2:.6f} segundos')
        #print(f'Tiempo de ejecución: {tiempo3:.6f} segundos')
        print(f'Tiempo de ejecución: {tiempo4:.6f} segundos')