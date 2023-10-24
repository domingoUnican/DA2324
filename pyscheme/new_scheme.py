# scheme.py

# Core-idea: An Evaluator

# An Environment that stores names/values (global environment)
env = {
   'two': 2,
   '+': lambda x, y: x+y,     # "Built-in" procedure
   '-': lambda x, y: x-y,
   '*': lambda x, y: x*y,
   '=': lambda x, y: x == y,
   '<': lambda x, y: x < y,
}


def substitucion(exp, name, value):
    if exp == name:
        return value
    elif isinstance(exp, tuple):
        return tuple(substitucion(e, name, value) for e in exp)
    else:
        return exp


def crear_funcion(argnames, lexp):
    # env is the environment where the procedure was *DEFINED*
    def llamar(*values):      # *args take any arguments
        assert len(values) == len(argnames), "Wrong # args"
        exp = lexp    # Starting expression
        for name, val in zip(argnames, values):
            exp = substitucion(exp, name, val)
        return seval(exp)
    return llamar


def seval(exp):
    if isinstance(exp, (int, bool)):
        return exp
    elif isinstance(exp, str):
        return env[exp]
    elif isinstance(exp, tuple):
        if exp[0] == 'define':     # "Special Form"
            name = exp[1]
            value = seval(exp[2])
            env[name] = value
            return
        elif exp[0] == 'if':
            test = seval(exp[1])
            if test:
                return seval(exp[2])
            else:
                return seval(exp[3])
        elif exp[0] == 'lambda':
            argnames = exp[1]
            lexp = exp[2]
            return crear_funcion(argnames, lexp)
        elif exp[0] == 'quote':
            return exp[1]

        # Tuples are procedure calls
        # Evaluate all of the parts first
        evaluated_exp = [seval(e) for e in exp]
        return evaluated_exp[0](*evaluated_exp[1:])


assert seval(42) == 42
assert seval("two") == 2
assert seval(('+', 2, 3)) == 5
seval(('define', 'x', ('+', 2, 3)))
assert seval('x') == 5
assert seval(('if', ('<', 'x', 10), 3, 4)) == 3

# Can you compute factorials?
# (define fact (lambda (n) (if (= n 0) 1 (* n (fact (- n 1))))))
seval(('define', 'a', 5))
seval(('define', 'fact', 
       ('lambda', ('n',), ('if', 
                           ('=', 'n', 0),
                           1,
                           ('*', 'n', ('fact', ('-', 'n', 1)))))))

assert seval(('fact', 'a')) == 120
