//
//------------------------------------------------------------------------
#version 3.5;
//------------------------------------------------------------------------
//------------------------------------------------------------------------
//global_settings {  assumed_gamma 1.0 }
global_settings {
	assumed_gamma 1.80
	max_trace_level 10
	}

#include "FRmacros.inc"
//------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
//------------------------------------------------------------------------
//Finition
#declare finition = finish { ambient 0.40 diffuse 0.60 phong 0.85 brilliance 2 };
//------------------------------------------------------------------------
#declare hauteur=30;
//Lumière -------------------------------------------------------------------
light_source{<2500,2500,-1500> color White}
//Sol -------------------------------------------------------------------
plane { <0,1,0>, 0
       texture {  pigment{ color rgb<1,1,1>} 
      finish { ambient 0.45 diffuse 0.85  phong 1}}
}
// -------------------------------------------------------------------

//Axes_plan()

//Grille_plane()

//Points_droite_plan()

//Droite_modulaire_plan()
//Droite_modulaire_plan_unie()


#declare G_rext=5.5;
#declare G_rint=3.5;
//Ancien #declare G_couleur= color <1,0.5,0>;//Red;
#declare G_couleur= color <0.93,0.26,0>;//Red;
#declare P_rext=G_rint-0.1;
#declare P_rint=1.5;
//Ancien #declare P_couleur=color <1/3,0.6,0.1843>;//Yellow;
#declare P_couleur=color <0.06,0.63,0>;//Yellow;


#declare epaisseur=0.5;

#declare cardinal=26;
#declare Alphabet = array[2*cardinal]
{"A","B","C","D","E","F","G","H","I","J","K","L","M",
  "N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
  "A","B","C","D","E","F","G","H","I","J","K","L","M",
  "N","O","P","Q","R","S","T","U","V","W","X","Y","Z"} 
/*
#declare cardinal=7;
#declare Alphabet = array[2*cardinal]
{"Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche",
  "Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche"} 
*/



#declare largeur=1.2;
//dec=0#declare decalage=0;
//dec=3#declare decalage=-3;
//dec=m3#declare decalage=3;
#declare rho=2.5*hauteur;
#declare shift=decalage*largeur/2;
//#declare shift=0;

//Caméra -------------------------------------------------------------------
#declare Camera_cesar 
       = camera {                               // top view
	 angle 20
	 location <shift,rho,-rho>
	 right     x*image_width/image_height
	 look_at   <shift,0,0>
       }
camera{Camera_cesar}
//Caméra -------------------------------------------------------------------

#declare trait=0.01;


#declare decale=<largeur*decalage,0,-(G_rext-G_rint)-1>;

box{<-largeur*cardinal/2-largeur/2,0,0>,<largeur*cardinal/2-largeur/2,epaisseur,G_rext-G_rint>
  pigment{ color G_couleur }  finish { finition } 
  no_shadow
}

box{<-largeur*cardinal/2-largeur/2,0,0>,<largeur*cardinal/2-largeur/2,epaisseur,G_rext-G_rint>
  pigment{ color P_couleur }  finish { finition } 
  translate decale
  no_shadow
}


#declare i=0;
#while (i<cardinal)
  #declare ou=-largeur*cardinal/2+i*largeur;
  //////////////////////////////////////////////////GGGGGG
  #declare eplettre=0.15;
  #declare taille=Text_Width("fonte.ttf", 
    Alphabet[i],1,0);
  text{ttf "fonte.ttf", Alphabet[i],eplettre, 0 
    texture{  pigment{color rgb<0,0,0>}
      finish{ambient 0.45 diffuse 0.55 phong 1 reflection 0.1}}
    translate <-taille/2,0,-eplettre/2>
    scale 1
    rotate<90,0,0>
    translate <ou,epaisseur,(G_rext-G_rint)/2-(G_rext-G_rint)/5>
    no_shadow}
  #if (i>0)
    cylinder{<0,0,0>,<0,0,G_rext-G_rint>,trait
      texture{  pigment{color rgb<1,1,1>}
	finish{ambient 0.45 diffuse 0.55 phong 1 reflection 0.1}}
      translate <ou-largeur/2,epaisseur,0>
    }
  #end
  //////////////////////////////////////////////////PPPPPPP
  #declare eplettre=0.15;
  #if (decalage<0)
    #declare j=cardinal-i;
  #else
    #declare j=i;
  #end
  #declare taille=Text_Width("fonte.ttf", 
    Alphabet[i],1,0);
  text{ttf "fonte.ttf", Alphabet[i],eplettre, 0 
    texture{  pigment{color rgb<0,0,0>}
      finish{ambient 0.45 diffuse 0.55 phong 1 reflection 0.1} }
    translate <-taille/2,0,-eplettre/2>
    scale 1
    rotate<90,0,0>
    translate <ou,epaisseur,(G_rext-G_rint)/2-(G_rext-G_rint)/5>
    translate decale
  no_shadow}
  #if (i>0)
  cylinder{<0,0,0>,<0,0,G_rext-G_rint>,trait
    texture{  pigment{color rgb<0,0,0>}
      finish{ambient 0.45 diffuse 0.55 phong 1 reflection 0.1}}
    translate <ou-largeur/2,epaisseur,0>   
    translate decale
  }
  #end
/*
  #declare taille=Text_Width("fonte.ttf", 
    Alphabet[i+decalage],1,0);
  text{ttf "fonte.ttf", Alphabet[i+decalage],0.2, 0 
    texture{  pigment{color rgb<0,0,1>}
      finish{ambient 0.45 diffuse 0.55 phong 1 reflection 0.1}}
    translate <-taille/2,0,-0.1>
    scale 0.8
    rotate<90,0,0>
    translate <0,epaisseur,(P_rext+P_rint)/2>
    rotate<0,langle,0>
  }

  cylinder{<0,0,0>,<0,0,P_rext-P_rint>,trait
    texture{  pigment{color rgb<0,0,0>}
      finish{ambient 0.45 diffuse 0.55 phong 1 reflection 0.1}}
    translate <0,epaisseur,P_rint>
    rotate<0,langle+360/(2*cardinal),0>
  }
  */
  #declare i=i+1;
#end
  
//#declare n=6;
//#declare rayon_grille=0.02;
//Axes_espace()
