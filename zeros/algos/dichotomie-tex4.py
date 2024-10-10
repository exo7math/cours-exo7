def dichotomie(a,b,prec):
    if b-a<=prec:
        return a,b
    else:
        c = (a+b)/2
        if f(a)*f(c) <= 0:
            return dichotomie(a,c,prec)
        else:
            return dichotomie(c,b,prec)