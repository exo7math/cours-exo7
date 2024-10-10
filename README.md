Sources des cours Exo7
======================

Voici les explications pour récupérer et utiliser les sources de cours Exo7.

Tout d'abord quelques liens :

  * Le [site Exo7](http://exo7.emath.fr/) pour récupérer les fichiers *pdf* des cours et des exercices ainsi que les liens vers les vidéos.
  * En particulier vous trouverez tous les exercices et leur sources sur la [page des professeurs](http://exo7.emath.fr/prof.html), vous pouvez aussi [chercher des exercices](http://exo7.emath.fr/search.php) par thème.
  * Les [vidéos Exo7](https://www.youtube.com/user/Exo7Math).


Récuperer les fichiers sources des cours
----------------------------------------

Ce qui nous intéresse ici ce sont les fichiers sources des cours :

  * Le site est [GitHub d'Exo7](https://github.com/exo7math).
  * Le dossier (*Repository*) est `cours-exo7`.
  * Vous pouvez récuperer tous les fichiers en cliquant sur le bouton en haut à droite *Download ZIP*.



Fichiers et répertoires
-----------------------

### Structure générale ###


Les fichiers `livre-xxx.tex` sont les fichiers principaux, au format *LaTeX*, des deux tomes du livre. Ils sont petits et contiennent essentiellement des instructions d'inclusion des chapitres.

Chaque chapitre est dans un répertoire séparé au nom explicite.

La plupart de ces répertoires contiennent un sous-répertoire `figure` qui contient les figures. La majorité des figures sont écrites dans le langage *TikZ/PGF* et portent une extension `.tikz`.

### Fichier de styles ###

Le fichier `exo7book.sty` est le fichier de style principal et peut être évoqué avec l'une des options `[screen]`, `[print]`, `[minimal]`. En fonction du choix de l'option, l'un des fichiers `exo7book-screen.sty`, `exo7book-print.sty`, `exo7book-minimal.sty` est invoqué. Et la partie commune du style, qui ne dépend pas du choix de l'option, se trouve dans le fichier `exo7book-common.sty`. Tous ces fichiers sont commentés.

Compilation
-----------

Les options `[screen]` et `[minimal]` sont compilables avec PDF/Lua/XeLaTeX. Par contre, il faut compiler l'option `[print]` de préférence avec PDFLaTeX.

Vous pouvez compiler les chapitres un par un également. Pour cela il suffit de compiler le fichier `ch\_xxx.tex` qui se trouve dans le répertoire en question. Ceci est rendu possible grâce à l'utilisation de package `standalone`.

Vous trouverez des explications à partir du fichiers `LISEZMOI.tex` pour accélérer la compilation en externalisant la génération des images.

Des questions ?
---------------

Pour nous contacter :

  * exo7@emath.fr
  * [Facebook](https://www.facebook.com/Exo7Math)


