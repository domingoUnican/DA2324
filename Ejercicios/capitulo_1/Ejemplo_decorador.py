def decorador(f):
    def temp(*args):
        print("llamo a la funcion", args)
        return f(*args)
    return temp

@decorador
def f(x,y):
    a = 2*x
    return a + x

def f_1(x):
    def g(a):
        return a + x
    return g(2*x) 

print(f(6,9))
