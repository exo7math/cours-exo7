for P in {True, False}:
    for Q in {True, False}:
        for R in {True, False}:
            print(not((not(P and Q) and (Q or R)) and (P and (not R))))