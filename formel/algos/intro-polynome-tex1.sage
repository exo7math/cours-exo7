R.<X> = QQ[]
P = X^4-3*X^2-1
Q = (X+1)^4
(P*Q).degree() == P.degree() + Q.degree()
(P-Q).degree() == max(P.degree(),Q.degree())