#!/bin/bash

#povray Antialias=on +H1024 +W1280 +O
#povray Antialias=on +H600 +W800 +O
#povray Antialias=on +H300 +W400 +O


FONTE="/home/recher/outils/fontes/arial.ttf"
#ttf-dejavu/DejaVuSans.ttf"
#freefont/FreeSans.ttf"


FONTE=${FONTE//\//\\\/}
FONTE=${FONTE//./\\.}


CMD="povray Antialias=on  Verbose=false" # Display=false"
#CMD="povray Antialias=on Display=false Verbose=false"
#+H1024 +W1280 +O

#Pour l'exposé : +H1024 +W1280 ie ce qui est prévu dans les paramètres ci-dessus
#Si on veut aller plus vite, on met un coefficient de réduction
coeff=1
#coeff=2
#coeff=3
#coeff=4
#coeff=6

nombre=0
##############################
function trav {
    povtemp=$2.pov
    cp $2 $povtemp
    png=${2%.*}
    for i in `echo $1 | tr ' ' '\n'`
    do
    #echo "option -------$i"
	retirer="\/\/"$i 
	sed -i -e "s/$retirer//g" $povtemp
	option=${i#*=}
    #echo "option -------$option"
	png=$png"_"$option
    done
    png=$png.png
    
    sed -i -e "s/fonte\.ttf/$FONTE/g" $povtemp 
    sed -e "s/fonte\.ttf/$FONTE/g" FRmacros_orig.inc  > FRmacros.inc
    
    he=$3
    he=$(((he+he)/coeff))
    wi=$4
    wi=$(((wi+wi)/coeff)) 
    echo "=============================>"$png
    $CMD +H$he +W$wi +O/tmp/$png $povtemp 
    
    source=${2%.*}
    transparents="semaine Cesar Cesar_plan"
    cp /tmp/$png ./../$png 
    for i in $transparents
    do 
	if [ "$i" = "$source" ];
	then
	    convert /tmp/$png  -alpha set  -transparent white   ./../$png
	fi
    done
    
    #rm $povtemp
    
    nombre=$((nombre+1))
} 
 
##############################
#echo $nombre "fichiers créés"
#exit
##############################

##############################
echo "Traitement de Enigma.pov"
trav "dec=7 alpha=bi coul=unesurune" Enigma.pov 555 800
exit

##############################
echo "Traitement de Enigma.pov"
trav "dec=0 alpha=bi coul=unesurdeux" Enigma.pov 555 800
trav "dec=0 alpha=tri coul=deuxsurdeux" Enigma.pov 555 800

exit

##############################
echo "Traitement de Enigma.pov"
trav "dec=0 alpha=bi coul=unesurune" Enigma.pov 555 800
trav "dec=1 alpha=bi coul=unesurune" Enigma.pov 555 800
trav "dec=2 alpha=bi coul=unesurune" Enigma.pov 555 800

exit

##############################
echo "Traitement de Enigma_tri.pov"
trav "dec=0" Enigma_tri.pov 555 800

exit

##############################
echo "Traitement de Enigma.pov"
trav "dec=0" Enigma.pov 555 800
trav "dec=1" Enigma.pov 555 800
trav "dec=2" Enigma.pov 555 800

exit

##############################
echo "Traitement de Cesar.pov"
#trav "dec=0" Cesar.pov 555 800 
trav "dec=3" Cesar.pov 555 800

##############################
echo "Traitement de Cesar_plan.pov"
#trav "dec=0" Cesar_plan.pov 300 800
trav "dec=3" Cesar_plan.pov 300 800

exit

############################################# MOOC FIN ## MOOC FIN ## MOOC FIN #################################### 


trav "tore=2d" tore.pov 600 800 


exit



exit

montage -tile 5x3 -geometry 320x ../horloge_12_01.png ../horloge_12_02.png ../horloge_12_03.png ../horloge_12_04.png ../horloge_12_05.png ../horloge_12_11.png ../horloge_12_10.png ../horloge_12_09.png ../horloge_12_08.png ../horloge_12_07.png ../blanc.png ../blanc.png ../horloge_12_06.png ../blanc.png ../blanc.png ../horloges_temp.png


composite -geometry 1600x1200 -gravity center  ../horloges_temp.png ../blanc.png ../horloges_temp.png

rm ../horloges_temp.png


exit








exit

##############################
##############################
convert -size 1600x1200 xc:white  ../blanc.png



##############################
echo "Traitement de courbe_elliptique_mod_ZZ.pov"
trav "ecm=1branche modulo=13 nbpts=8" courbe_elliptique_mod_ZZ.pov 600 800 
trav "ecm=1branche modulo=13 nbpts=2" courbe_elliptique_mod_ZZ.pov 600 800 
trav "ecm=1branche modulo=13 nbpts=18" courbe_elliptique_mod_ZZ.pov 600 800 


####trav "ecm=1branche modulo=7" courbe_elliptique_mod_ZZ.pov 600 800 
####trav "ecm=1branche modulo=11" courbe_elliptique_mod_ZZ.pov 600 800 
####trav "ecm=1branche modulo=17_17" courbe_elliptique_mod_ZZ.pov 600 800 
####trav "ecm=1branche modulo=17_8" courbe_elliptique_mod_ZZ.pov 600 800 
####trav "ecm=1branche modulo=17_5" courbe_elliptique_mod_ZZ.pov 600 800 


##############################
echo "Traitement de courbe_elliptique_mod_tore.pov"
trav "ecm=ovale" courbe_elliptique_mod_tore.pov 600 800 

##############################
echo "Traitement de courbe_elliptique_mod.pov"
trav "ecm=1branche" courbe_elliptique_mod.pov 600 800 
trav "ecm=ovale" courbe_elliptique_mod.pov 600 800 
trav "ecm=min19" courbe_elliptique_mod.pov 600 800 
trav "ecm=min19" courbe_elliptique_mod.pov 600 800 

trav "ecm=1branche plus=sommeOK etape=1" courbe_elliptique_mod.pov 600 800 
trav "ecm=1branche plus=sommeOK etape=2" courbe_elliptique_mod.pov 600 800 
trav "ecm=1branche plus=sommeOK etape=3" courbe_elliptique_mod.pov 600 800 

#trav "ecm=1branche plus=double etape=1" courbe_elliptique_mod.pov 600 800 
#trav "ecm=1branche plus=double etape=2" courbe_elliptique_mod.pov 600 800 
trav "ecm=1branche plus=double etape=3" courbe_elliptique_mod.pov 600 800 


#trav "ecm=1branche plus=sommeKO etape=1" courbe_elliptique_mod.pov 600 800 
trav "ecm=1branche plus=sommeKO etape=2" courbe_elliptique_mod.pov 600 800 

###trav "ecm=9points" courbe_elliptique_mod.pov 600 800 
###trav "ecm=1branche plus=somme" courbe_elliptique_mod.pov 600 800 
###trav "ecm=ovale plus=somme" courbe_elliptique_mod.pov 600 800 
###trav "ecm=9points plus=somme" courbe_elliptique_mod.pov 600 800 


montage -tile 2x2 -geometry 800x600 ../courbe_elliptique_mod_tore_1branche.png ../blanc.png ../blanc.png ../courbe_elliptique_mod_1branche.png  ../courbe_elliptique_mod_tore_1branche_2.png

##############################
echo "Traitement de courbe_elliptique_reelle_avecO.pov"
trav "ecr=1branche" courbe_elliptique_reelle_avecO.pov 600 800 
##trav "ecr=ovale" courbe_elliptique_reelle_avecO.pov 600 800 

##############################
echo "Traitement de courbe_elliptique_reelle.pov"

trav "ecr=1branche" courbe_elliptique_reelle.pov 600 800 
trav "ecr=ovale" courbe_elliptique_reelle.pov 600 800 

trav "ecr=1branche plus=somme etape=1" courbe_elliptique_reelle.pov 600 800 
trav "ecr=1branche plus=somme etape=2" courbe_elliptique_reelle.pov 600 800 
trav "ecr=1branche plus=somme etape=3" courbe_elliptique_reelle.pov 600 800 
trav "ecr=ovale plus=somme etape=3" courbe_elliptique_reelle.pov 600 800 

trav "ecr=ovale plus=double etape=1" courbe_elliptique_reelle.pov 600 800 
trav "ecr=ovale plus=double etape=2" courbe_elliptique_reelle.pov 600 800 
trav "ecr=ovale plus=double etape=3" courbe_elliptique_reelle.pov 600 800 

##############################
echo "Traitement de droites_modulaires.pov"
trav "dtes_mod=aucune avec=pts" droites_modulaires.pov 600 800 
trav "dtes_mod=aucune avec=dtes" droites_modulaires.pov 600 800 
trav "dtes_mod=aucune avec=pts toutes_dtes=ttes" droites_modulaires.pov 600 800 

trav "dtes_mod=six avec=pts" droites_modulaires.pov 600 800 
trav "dtes_mod=six avec=dtes" droites_modulaires.pov 600 800 

trav "dtes_mod=quatre avec=pts" droites_modulaires.pov 600 800 
trav "dtes_mod=quatre avec=dtes" droites_modulaires.pov 600 800 

trav "dtes_mod=trois avec=pts" droites_modulaires.pov 600 800 
trav "dtes_mod=trois avec=dtes" droites_modulaires.pov 600 800 

trav "dtes_mod=deux avec=pts" droites_modulaires.pov 600 800 
trav "dtes_mod=deux avec=dtes" droites_modulaires.pov 600 800 

trav "dtes_mod=une avec=pts" droites_modulaires.pov 600 800 
trav "dtes_mod=une avec=dtes" droites_modulaires.pov 600 800 

montage -tile 3x2 -geometry 533x400 ../droites_modulaires_une_dtes.png ../droites_modulaires_deux_dtes.png ../droites_modulaires_trois_dtes.png ../droites_modulaires_quatre_dtes.png ../droites_modulaires_six_dtes.png ../droites_modulaires_aucune_dtes.png ../droites_modulaires_tmp.png

composite -geometry 1600x1200 -gravity center  ../droites_modulaires_tmp.png ../blanc.png ../droites_modulaires.png

rm ../droites_modulaires_tmp.png

##############################
echo "Traitement de tore.pov"
trav "tore=g" tore.pov 600 800 
trav "tore=p" tore.pov 600 800 
trav "tore=d" tore.pov 600 800 
trav "tore=2d" tore.pov 600 800 
trav "tore=12_5_7" tore.pov 600 800 
trav "tore=12_2_10_8_4" tore.pov 600 800 

##############################
echo "Traitement de cylindre.pov"
trav "cyl=g" cylindre.pov 600 800 
trav "cyl=p" cylindre.pov 600 800 
trav "cyl=d" cylindre.pov 600 800 
trav "cyl=2d" cylindre.pov 600 800 

##############################
echo "Traitement de cylindre_partiel.pov"
trav "cyl_part=01" cylindre_partiel.pov 600 800 
trav "cyl_part=20" cylindre_partiel.pov 600 800 
trav "cyl_part=40" cylindre_partiel.pov 600 800 
trav "cyl_part=60" cylindre_partiel.pov 600 800 
trav "cyl_part=80" cylindre_partiel.pov 600 800 
trav "cyl_part=120" cylindre_partiel.pov 600 800 
trav "cyl_part=180" cylindre_partiel.pov 600 800 
trav "cyl_part=250" cylindre_partiel.pov 600 800 
trav "cyl_part=308" cylindre_partiel.pov 600 800 

##############################
echo "Traitement de plan_modulaire.pov"
trav "planmod=g" plan_modulaire.pov 600 800 
trav "planmod=p" plan_modulaire.pov 600 800 
trav "planmod=d" plan_modulaire.pov 600 800 

##############################
echo "Traitement de plan.pov"
trav "plan=d" plan.pov 600 800 
trav "plan=g" plan.pov 600 800 
trav "plan=p" plan.pov 600 800 


##############################
echo "Traitement de horloge.pov"
trav "module=12" horloge.pov 555 800 
trav "module=12 orbite=00" horloge.pov 555 800 
trav "module=12 orbite=01" horloge.pov 555 800 
trav "module=12 orbite=02" horloge.pov 555 800 
trav "module=12 orbite=03" horloge.pov 555 800 
trav "module=12 orbite=04" horloge.pov 555 800 
trav "module=12 orbite=05" horloge.pov 555 800 
trav "module=12 orbite=06" horloge.pov 555 800 
trav "module=12 orbite=07" horloge.pov 555 800 
trav "module=12 orbite=08" horloge.pov 555 800 
trav "module=12 orbite=09" horloge.pov 555 800 
trav "module=12 orbite=10" horloge.pov 555 800 
trav "module=12 orbite=11" horloge.pov 555 800 

trav "module=60" horloge.pov 555 800 
trav "module=60 orbite=00" horloge.pov 555 800 
trav "module=60 orbite=01" horloge.pov 555 800 
trav "module=60 orbite=02" horloge.pov 555 800 
trav "module=60 orbite=03" horloge.pov 555 800 
trav "module=60 orbite=04" horloge.pov 555 800 
trav "module=60 orbite=05" horloge.pov 555 800 
trav "module=60 orbite=06" horloge.pov 555 800 
trav "module=60 orbite=07" horloge.pov 555 800 
trav "module=60 orbite=08" horloge.pov 555 800 
trav "module=60 orbite=09" horloge.pov 555 800 
trav "module=60 orbite=10" horloge.pov 555 800 
trav "module=60 orbite=11" horloge.pov 555 800 
trav "module=60 orbite=12" horloge.pov 555 800
trav "module=60 orbite=13" horloge.pov 555 800
trav "module=60 orbite=14" horloge.pov 555 800
trav "module=60 orbite=15" horloge.pov 555 800
trav "module=60 orbite=16" horloge.pov 555 800
trav "module=60 orbite=17" horloge.pov 555 800
trav "module=60 orbite=18" horloge.pov 555 800
trav "module=60 orbite=19" horloge.pov 555 800
trav "module=60 orbite=20" horloge.pov 555 800
trav "module=60 orbite=21" horloge.pov 555 800
trav "module=60 orbite=22" horloge.pov 555 800
trav "module=60 orbite=23" horloge.pov 555 800
trav "module=60 orbite=24" horloge.pov 555 800
trav "module=60 orbite=25" horloge.pov 555 800
trav "module=60 orbite=26" horloge.pov 555 800
trav "module=60 orbite=27" horloge.pov 555 800
trav "module=60 orbite=28" horloge.pov 555 800
trav "module=60 orbite=29" horloge.pov 555 800


##############################
echo "Traitement de semaine.pov"
trav "commence=99 modulo=99 petit=non" semaine.pov 555 800 
trav "commence=1 modulo=nm petit=non" semaine.pov 555 800 
trav "commence=8 modulo=nm petit=non" semaine.pov 555 800 
trav "commence=8 modulo=m petit=non" semaine.pov 555 800 
trav "commence=0 modulo=nm petit=non" semaine.pov 555 800 
trav "commence=0 modulo=nm petit=oui" semaine.pov 555 800 
trav "commence=0 modulo=m petit=oui" semaine.pov 555 800 

##############################
echo "Traitement de Cesar.pov"
trav "dec=0" Cesar.pov 555 800 
trav "dec=3" Cesar.pov 555 800

##############################
echo "Traitement de Cesar_plan.pov"
trav "dec=0" Cesar_plan.pov 300 800
trav "dec=3" Cesar_plan.pov 300 800
#trav "dec=m3" Cesar_plan.pov 300 800


echo $nombre "fichiers créés"













##############################
##############################
##############################
##############################
##############################
##############################





function travv {
sed -e "s/$1//g" $2 > $2.pov
sed -i -e "s/fonte.ttf/$FONTE/g" $2.pov 
he=$3
he=$(((he+he)/coeff))
wi=$4
wi=$(((wi+wi)/coeff)) 
povray +H$he +W$wi +O/tmp/${2%.*}${1#*=}.png $2.pov 
mv /tmp/${2%.*}${1#*=}.png ./..
rm $2.pov 
} 
 




function travold {
sed -e "s/$1//g" $3 > $3.pov
sed -i -e "s/fonte\.ttf/$FONTE/g" $3.pov 
sed -e "s/$2//g" $3.pov > $3_.pov
he=$4
he=$(((he+he)/coeff))
wi=$5
wi=$(((wi+wi)/coeff)) 
if [ "$2" = "azertyuiop" ] 
then nomfichier=${3%.*}${1#*=}.png
else nomfichier=${3%.*}${1#*=}${2#*=}.png 
fi
echo $nomfichier
$CMD +H$he +W$wi +O/tmp/$nomfichier $3_.pov 

convert /tmp/$nomfichier  -alpha set  -transparent white   ./../$nomfichier
#mv /tmp/$nomfichier ./..
#rm $3.pov 
#rm $3_.pov 
nombre=$((nombre+1))
} 
