# scheme.py
#
# Challenge: Can you implement a scheme interpreter in Python that's
# capable of executing the following procedure?

# A procedure definition for:
#
#   (define fact
#      (lambda (n) (if (= n 1)
#                   1
#                   (* n (fact (- n 1))))))
#
# It's represented in Python using the following tuple:

fact = ('define', 'fact', 
        ('lambda', ('n',), ('if', ('=', 'n', 1),
                            1,
                            ('*', 'n', ('fact', ('-', 'n', 1))))))

def pon_en_env(x, y):
    global env
    env[x] = seval(y)

def hacer_funcion(argumentos, cuerpo): # Equivalente de hacer una funcion
    def funcion(*valores):
        for nombre, valor in zip(argumentos, valores):
            cuerpo = substitucion(cuerpo, nombre, valor)
        return cuerpo
    return funcion # se devuelve un objeto funcion

def substitucion(exp, nombre, valor):
    if exp == nombre:
        return valor
    elif isinstance(exp, tuple):
        return tuple(substitucion(e, nombre, valor) for e in exp)
    else:
        return exp

env = {
        '+': lambda *args: sum(args),
        '-': lambda *args: args[0] - sum(args[1:]),
        '*': lambda *args: args[0] * args[1],
        '/': lambda *args: args[0] / args[1],
        'define': pon_en_env,
        'fact': fact
}
# You will define the following procedure for evaluating an expression
def seval(sexp):
    if isinstance(sexp, int):
        return sexp
    elif isinstance(sexp, str):
        return env.get(sexp, sexp) 
    elif isinstance(sexp, tuple):
        if sexp[0] == 'if':
            condition = seval(sexp[1])
            if condition:
                return seval(sexp[2])
            else:
                return seval(sexp[3])
        elif sexp[0] == 'lambda':
            args = sexp[1]
            body = sexp[2]
            return hacer_funcion(args, body)
        elif sexp[0] == 'define':
            name = sexp[1]
            value = seval(sexp[2])
            pon_en_env(name, value)
            return value
        elif sexp[0] == 'fact':  # Llamada a factorial
            return fact
        func = seval(sexp[0])
        args = [seval(e) for e in sexp[1:]]
        return func(*args)
    
    
# In writing seval, you are ONLY allowed to use the rules of Scheme
# evaluation that you currently know about.  So far, this includes the
# substitution model and the notion of special forms.
    
# Some basic tests
assert seval(42) == 42
assert seval(('+', ('+', 2,1), 3)) == 6
seval(('define', 'n', 5))

assert seval('n') == 5

# Now the ultimate test--can you run your procedure?
seval(fact)
assert seval(('fact', 'n')) == 120