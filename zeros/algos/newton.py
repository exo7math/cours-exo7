#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Newton
#------------------------------------------


# Cas de la racine carrée sqrt(a)
# n est le nombre d'itérations
def racine_carree(a,n):
    u=4                # N'importe qu'elle valeur > 0
    for i in range(1,n+1):
        u = 0.5*(u+a/u)
        print("Etape ", i, " : ", u) 
    return u
    

# La fonction f(x)
def f(x):
    return x**12 - 1.1


# La fonction dérivée f'(x)
def df(x):
    return 12*x**11    


# Méthode de Newton 
# u est le terme initial, n est le nombre d'étapes
def newton(u,n):  
    for i in range(1,n+1):
        u = u-f(u)/df(u)
        print("Etape ", i, " : ", u) 
    return u


    
print("Calcul de racine(10) par la méthode de Newton")
print(racine_carree(10,5))  


print("Calcul de 1,1^(1/12) par la méthode de Newton")
print(newton(1,5)) 

# Calcul de racine de 10 avec 1000 décimales

# Module décimale pour avoir une grande précision 
from decimal import *

# Precision souhaitée (par exemple 1010 décimales pour éviter les erreurs d'arrondi)
getcontext().prec = 1000


# Cas de la racine carrée sqrt(a)
# n est le nombre d'itérations
def racine_carree_bis(a,n):
    u=Decimal(4)                # N'importe qu'elle valeur > 0
    for i in range(1,n+1):
        u = (Decimal(u)+Decimal(a)/Decimal(u))/Decimal(2)
        print("Etape ", i, " : ", u) 
    return u

# Exemple 
n=11
print("Racine de 10 (n=%d) : " %n, racine_carree_bis(10,n))

# Pour n=11 on trouve racine(10) avec 1000 décimales
#3.
#16227766016837933199889354443271853371955513932521
#68268575048527925944386392382213442481083793002951
#87347284152840055148548856030453880014690519596700
#15390334492165717925994065915015347411333948412408
#53169295770904715764610443692578790620378086099418
#28371711548406328552999118596824564203326961604691
#31433612894979189026652954361267617878135006138818
#62785804636831349524780311437693346719738195131856
#78403231241795402218308045872844614600253577579702
#82864402902440797789603454398916334922265261206779
#26516760310484366977937569261557205003698949094694
#21850007358348844643882731109289109042348054235653
#40390727401978654372593964172600130699000095578446
#31096267906944183361301813028945417033158077316263
#86395193793704654765220632063686587197822049312426
#05345411160935697982813245229700079888352375958532
#85792513629646865114976752171234595592380393756251
#25369855194955325099947038843990336466165470647234
#99979613234340302185705218783667634578951073298287
#51579452157716521396263244383990184845609357626020
