#!/usr/bin/python3
# -*- coding: utf-8 -*-

#------------------------------------------
# Calcul de Pi au hasard
#------------------------------------------

# Module qui génère des nombres aléatoires
import random

Tir = 0                  # Numéro du tir
NbTirDansLeDisque = 0    # Nombre de tirs dans le disque

while (Tir < 1000):
    Tir = Tir + 1
    # On tire au hasard un point (x,y) dans [0,1] x [0,1]
    x = random.random()
    y = random.random()
    if (x*x+y*y <= 1):    # On est dans le disque
        NbTirDansLeDisque = NbTirDansLeDisque + 1
        
MonPi = 4*NbTirDansLeDisque / Tir
print("Valeur expérimentale de Pi : %0.3f" %MonPi)