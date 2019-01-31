#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Nombre de 1 entre 1 et 999
#------------------------------------------

NbDeUn = 0

for N in range(1,999+1):
    ChiffreUnite = N % 10
    ChiffreDizaine = (N // 10) % 10
    ChiffreCentaine = (N // 100) % 10  
    if (ChiffreUnite == 1):
        NbDeUn = NbDeUn + 1
    if (ChiffreDizaine == 1):
        NbDeUn = NbDeUn + 1    
    if (ChiffreCentaine == 1):
        NbDeUn = NbDeUn + 1        
print("Nombre d'occurences du chiffre '1' :", NbDeUn)