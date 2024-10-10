var('n')
test = conjec(n)-conjec(n-1)-conjec(n-2)
print(test.canonicalize_radical())