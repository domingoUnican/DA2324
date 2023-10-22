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


env = {'+': lambda x,y: x+y ,
       '-': lambda x,y: x-y ,
       '*': lambda x,y: x*y ,
       '/': lambda x,y: x/y ,
       'define': lambda x,y: assign(x, y),
       '=': lambda x,y: x==y,
       'if': lambda x,y,z: conditional(x, y, z),
       'lambda': lambda x,y: replace(x, y)
    }

def assign(x, y):
    global env
    value = seval(y)
    env[x] = value
    
def conditional(x, y, z):
    if seval(x):
        return seval(y)
    else:
        return seval(z)

def replace(x, y):
    #x.replace(y)
    newX = []
    for element in x:
        if element == x:
            newX.append(y)
        elif isinstance(element, tuple):
            newX.append(replace(element, y))
        else:
            newX.append(element)

# You will define the following procedure for evaluating an expression
def seval(sexp):
    if isinstance(sexp, (int, bool)):
        return sexp
    elif isinstance(sexp, str):
        return env.get(sexp,sexp) 
    elif isinstance(sexp, tuple):
        if len(sexp) > 1:
            func = env.get(sexp[0],sexp[0]) 
            print("func: " + str(func))
            print("args: " + str(sexp[1:]))
            print(env.keys())
            args = [seval(e) for e in sexp[1:]]
            return func(*args)
        else:
            return seval(sexp[0])


# In writing seval, you are ONLY allowed to use the rules of Scheme
# evaluation that you currently know about.  So far, this includes the
# substitution model and the notion of special forms.
    
# Some basic tests
#assert seval(42) == 42
#assert seval(('+', 2, 3)) == 5
seval(('define', 'n', 5))
assert seval('n') == 5

# Now the ultimate test--can you run your procedure?
seval(fact)
assert seval(('fact', 'n')) == 120
