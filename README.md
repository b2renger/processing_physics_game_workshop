# processing_physics_game_workshop

A small introduction to OOP using processing geared towards game designers.

Processing est un langage de programmation basé sur java. Il est relativement simple d'accès et est destiné à être utilisé par des designer et artistes.

*"Processing seeks to ruin the careers of talented designers by tempting them away from their usual tools and into the world of programming and computation. Similarly, the project is designed to turn engineers and computer scientists to less gainful employment as artists and designers."*

Une introduction plus générale au langage processing est disponible à cette adresse : https://github.com/b2renger/Introduction_Processing

Ici nous allons nous concentrer sur les étapes nécessaires à la création d'un jeu *from scratch*. Cette ressource est destinée à être consultée en autonomie, elle découpe les étapes nécessaires à la création d'un jeu de buble catch en insistant sur la notion de programation objet. Même si les réponses sont fournies il est fortement recommandé de traiter les exercices par soit-même.

Chaque étape présente la même structure : il vous est d'abord présenté des objectifs à atteindre, puis quelques connaissances fondamentales vous sont expliquées suivies de ressources en lignes (souvent des liens vers des pages de documentation du langage processing), finalement le code relatif à l'exercice est expliqué. 

Voici ce à quoi vous devriez pouvoir arriver :

<img src="physics_game_workshop.gif" width="480" height="480" /><br>

* [Contenu]()<br>
    * [Découverte : un jeu en 33 lignes de code]()<br>
    * [ÉTAPE 0 : un outil de dessin]()<br>
    * [ÉTAPE 1 : se déplacer]()<br>
    * [ÉTAPE 2 : écrire des fonction sur mesure]()<br>
    * [ÉTAPE 3 : écrire une classe]()<br>
    * [ÉTAPE 4 : instancier 100 objet à partir d'une classe]()<br>
    * [ÉTAPE 5 : agents autonomes]()<br>
    * [ÉTAPE 6 : écrire des conditions]()<br>
    * [ÉTAPE 7 : réfléchir au gameplay]()<br>
    * [ÉTAPE 8 : construire des niveaux]()<br>
    * [ÉTAPE 9 : ajouter du son]()<br>
    * [ÉTAPE 10 : Idées pour aller plus loin !]()<br>


## Activité de découverte de processing

Dans cette activité de découverte nous allons nous attacher à créer un jeu simple en quelques lignes de codes.


[^home](https://github.com/b2renger/processing_physics_game_workshop#contenu)<br>

## ÉTAPE 0 : Familiarisation par un outil de dessin simple


### Missions :
* Se familiariser ensemble avec processing. (setup / draw / parenthèses / accolades / points virgules / fonction size / fonction background / commentaires)
* Chercher comment dessiner un cercle à un endroit précis de l’écran. (Un carré est un cas particulier de rectangle : un cercle est un cas particulier de …)
* Dessiner un cercle de diamètre 50 pixel qui suit la position de la souris.
* Changer la couleur de remplissage et de contour de votre cercle. Vous pouvez jouer avec la transparence.
* Dessiner trois autres cercles par symétrie : symétrie axiale horizontale, symétrie axiale verticale, symétrie centrale. Réfléchissez-y sur papier : dans un cadre précis (celui de la fenêtre d’affichage) quelques additions et soustractions suffisent.


### Connaissances fondamentales :

- les accolades permettent de délimiter des ensembles de lignes de code, chaque ligne va être lue et exécutée par la machine de manière séquentielle.

- chaque instruction (ou ligne de code) doit se terminer par un point virgule.

- il est possible de commenter une ligne (pour la rendre inactive) ou pour expliquer le fonctionnement d’une ligne précise en utilisant deux ‘slash’ consécutif devant un partie que l’on veut commenter ‘//’

- processing est un langage basé sur java qui nous fournit des fonctions pré-codées notamment pour dessiner des éléments à l’écran. On parle d’api de dessin (Application Programming Interface). 

- un variable en informatique est un espace dans la mémoire de votre ordinateur. Cet espace est définit par un type : quel espace est nécessaire pour stocker ce que l’on veut stocker. Un nom que l’on lui donne pour pouvoir accéder à son contenu, et le contenu lui-même. On peut voir ça comme un tiroir d’une taille définie avec une étiquette permettant de pouvoir s’y retrouver quand tous les tiroirs sont fermés.

- processing nous fournit aussi des variables d’ordre globale accessibles à tout moment par l’utilisateur (c’est le cas de ‘width’ et ‘height’)


### Ressources :
https://processing.org/tutorials/drawing/

https://processing.org/tutorials/color/

concernant le dernier point : 

https://processing.org/reference/width.html

https://processing.org/reference/height.html

### Explication du code
(todo)

[^home](https://github.com/b2renger/processing_physics_game_workshop#contenu)<br>

## ÉTAPE 1 : Se déplacer


### Missions :
* Réussir à faire se déplacer un cercle en fonction de la position de la souris. Contrairement à l’étape précédente, il faut que la souris soit la position cible de notre cercle et non la position à laquelle le cercle est dessiné. Pour cela : 
* Vous allez devoir stocker la position du cercle à dessiner dans deux variables globales.
* Stocker la position cible dans deux variables locales.
* Effectuer un calcul mathématique pour faire en sorte qu’à chaque frame, la valeur de nos variables globales se rapproche de celle de nos variables locales.


### Connaissances fondamentales :

* Processing exécute le code que vous écrivez de manière séquentielle et exécute le contenu de ‘draw’ en boucle le plus rapidement possible.

* Il est possible de créer des animations : image par image (à 60 fps - frame per second - idéalement) en utilisant des variable pour stocker la position d’un élément dessiné à une frame précise et en interpolant cette position à une position cible. On crée alors l’illusion d’une animation continue (plus le framerate est élevé plus l’animation paraîtra fluide).

* Les variables dites globales définies en dehors de la fonction setup et de la fonction draw : elles sont disponibles partout dans notre programme, et elles stockent leur valeur d’une frame à l’autre. Étant donné qu’elle sont amenées à être utilisées à divers endroit du code il est mieux qu’elles aient des noms équivoques.

* les variables locales sont définies dans un bloc de code (entre deux accolades - une ouvrante et une fermante) elles ne sont disponibles que dans ce bloc de code et elles sont réinitialisées à chaque frame calculée.


### Ressource :
https://processing.org/reference/lerp_.html

### Code :
(TODO)

[^home](https://github.com/b2renger/processing_physics_game_workshop#contenu)<br>


## ÉTAPE 2 : Écrire des fonctions sur mesure

### Missions :
* Créer un effet graphique permettant d’afficher une traînée plus ou moins persistante lorsque notre cercle se déplace.
* Transformer ce code en une fonction utilisant un paramètre pour spécifier la taille de cette traînée.
* Ecrire une nouvelle fonction permettant d’externaliser l’attraction entre la souris et le cercle dessiné. Il s’agit de recoder la fonction “lerp” utilisée précédemment à l’aide des ressources fournies. Cette fonction doit prendre 3 paramètres : un nombre virgule représentant une cible à atteindre, un deuxième nombre à virgule représentant la position actuelle de notre élément, un troisième paramètre permettant de choisir la vitesse de déplacement. Cette fonction doit nous retourner une nouvelle valeur flottante représentant, qui sera la position à laquelle on doit dessiner notre élément graphique. On appellera donc cette fonction deux fois : une fois pour chaque coordonnée.


### Connaissances fondamentales :
* Une fonction est un bloc de code qui exécute une série d’instruction de manière séquentielle. Elle est identifié par un nom que l’on souhaitera le plus équivoque possible, car elle permettra d’appeler un série d’instruction de manière régulière dans notre fonction ‘draw’ (oui ! “draw” et “setup” sont déjà des fonctions !).

* Il est possible de passer des arguments à une fonction.

* une fonction peut-être de type ‘void’ c’est à dire qu’elle manipule des variables globales, aura un effet graphique direct ou permettra de communiquer (affichage d'éléments, manipulation de l’image, envoi de données sur le réseau …). Par exemple dans le langage ‘processing’ : ‘ellipse’ est une fonction de type ‘void’. On lui passe 4 argument de type ‘float’ et cela a pour effet de dessiner une ellipse à un endroit donné avec un rayon donné.

* OU alors une fonction peut retourner un résultat. Ce résultat sera d’un type précisé avant le nom de la fonction. La fonction ‘lerp’ elle nous renvoie un flottant.

* exemple de fonction permettant de calculer la moyenne de deux nombres :
        float average(float a, float b){
                float result = (a + b) / 2; 
                return result;        
        }


### Ressources :
https://processing.org/examples/functions.html

https://processing.org/reference/return.html

http://paulbourke.net/miscellaneous/interpolation/

https://www.youtube.com/watch?v=zBo2D3Myo6Q

### Code
(TODO)

[^home](https://github.com/b2renger/processing_physics_game_workshop#contenu)<br>


## ÉTAPE 3 : Écrire une classe - la programmation orientée objet


### Mission :
* Transformer le code qui régit le mouvement de notre cercle en une classe.
* Instancier un objet et en appeler les fonctions principales.


### Connaissances fondamentales :

* L'apprentissage de la POO est la base de la plupart des langage informatique. Créer des objets est utile car cela permet de réutiliser du code et de bien séparer les différentes fonctionnalités. Si par exemple on vous demandait de faire en sorte que 100 cercles suivent la souris, vous devriez créer 200 variables (une pour chaque coordonnées) et appeler 200 fois la fonction ‘attract’ ou ‘lerp’ … Avec une classe on pourra automatiser l’appel à certaines fonctionnalités et réduire considérablement le nombre de ligne de code à écrire.

* Il ne faut pas confondre classe et instance de classe. Une classe c’est un peu comme la définition de quelque chose cette définition comprend les éléments constitutifs de cette chose mais aussi les actions que l’on peut effectuer : par exemple une table. Une table c’est un plateau horizontal avec 3 ou 4 pieds, ces pieds peuvent être réglables en hauteur ou avoir des roulettes; je peux poser des choses sur le plateau, je peux monter ou descendre le plateau (si les pieds sont réglables), je peux déplace la tables (si les pieds on des roulettes). La classe est la définition générale de ce qu’est notre table. Une instance de table est la table de modèle “Glivarp” que j’ai acheté, amené chez moi, monté et qui est maintenant dans mon salon. D’ailleurs j’en ai même acheté deux : la seconde et noire et je l’ai mise dans la cuisine… j’ai donc deux instances de tables chez moi.

* Créer une nouvelle classe c’est créer un nouveau type de variable disponible dans notre programme. (mais nous en reparlerons plus tard)

* Le nom d’une classe démarre généralement par une majuscule. 

* On peut définir des variables internes à la classe qui n’existeront qu’à l’intérieur de la classe.

* On peut aussi définir des fonctions internes à la classe, elle peuvent être de type “void” ou renvoyer une valeur de n’importe quel type.

* Une classe comporte un CONSTRUCTEUR, il est appelé au moment ou on crée une nouvelle instance d’objet.

* On crée un nouvel objet en utilisant le mot clé new suivi de l’appel du constructeur
                Glivarp gligli = new Glivarp(“white”) ;
                (Type) (Nom) = new (Constructeur)

* Une fois qu’une instance est créée on peut appeler les fonctions directement sur l’instance à l’aide de l’accesseur “.”
                gligli.repeindre(“rouge”);


### Ressources : 

https://processing.org/tutorials/objects/

https://www.youtube.com/watch?v=YcbcfkLzgvs

### Code :
(TODO)

[^home](https://github.com/b2renger/processing_physics_game_workshop#contenu)<br>


## ÉTAPE 4 : Instancier 100 objets à partir d’une classe 

### Mission :

* Utiliser un ArrayList et une boucle for pour créer 100 objets de type Balle qui vont suivre la souris.


### Connaissances fondamentales :

* Un ArrayList est un nouveau type de variable. Il s’agit d’un tableau dans lequel on peut ranger des objets (ie des instances d’une même classe). Il faut le voir comme une suite de case numérotées dans chacune de ces cases on peut ranger un objet et y accéder grâce à son index (le numéro de la case).

* Il existe plusieures formes de tableaux, nous utiliserons principalement l’ArrayList car c’est un tableau chaîné, cela signifie que nous pouvons ajouter et supprimer des éléments à n’importe quel index facilement. 

* Une boucle for est une structure qui permet d’itérer sur une collection d’objets. Elle se décompose en 3 parties : 
   * le mot clé “for”,
   * suivi entre parenthèse des conditions d’exécution de notre boucle (la définition d’une variable, une condition d’arrêt - sur la valeur à atteindre pour notre variable précédemment définie, l’incrémentation à proprement parler de notre variable).
   * le code à exécuter à chaque itération de la boucle qui se trouve comme habituellement entre deux accolades.

* La combinaison d’un ArrayList et d’une boucle for permet d’automatiser le traitement de nos objets en itérant sur chacune des cases de notre tableau, en récupérant l’objet qui y est stocké et en invoquant les méthodes de notre classe sur l’objet récupéré. En parcourant toutes les cases on traite tous les objets.

### Ressources

https://processing.org/reference/for.html

https://processing.org/reference/ArrayList.html

### Code
(TODO)

[^home](https://github.com/b2renger/processing_physics_game_workshop#contenu)<br>


## ÉTAPE 5 : Les agents autonomes

### Missions :

* Se familiariser avec la notion de random
* Se familiariser avec la notion de noise
* Créer une classe représentant un agent autonome : 
   * cet agent doit “popper” à une position aléatoire dans la fenêtre de jeu. (il faut donc passer des arguments au constructeur de notre classe)
   * il doit se déplacer aléatoirement à l’aide d’un noise. (il faut donc implémenter une fonction “move” dont le code se basera sur l’incrémentation d’une variable de position via un noise.
* Créer un ArrayList permettant de manipuler plusieurs agents et instancier 25 agents pour commencer.


### Connaissances fondamentales :

* la fonction random sert à nous renvoyer des nombres de type flottants aléatoires entre les deux bornes spécifiée en argument.

* la fonction noise est assez particulière : elle permet aussi de renvoyer des nombres aléatoires entre 0 et 1, mais ceux-ci forment des séquences qui apparaissent plus naturelles aux humains (au sens qui de qui proviennent de la nature). Le noise existe en plusieures implémentations, ici nous avons à faire à un noise de Perlin (du nom de son inventeur Ken Perlin : https://fr.wikipedia.org/wiki/Ken_Perlin)

### Ressources
https://processing.org/reference/random_.html

https://processing.org/reference/noise_.html

### Code
(TODO)

[^home](https://github.com/b2renger/processing_physics_game_workshop#contenu)<br>


## ÉTAPE 6 : La notion de conditionnelle

### Missions :
* Intégrer à votre code précédent un cercle qui suit la souris.
* Faire en sorte que lorsque la souris est au dessus d’un agent celui-ci disparaisse.
* Commencer avec un ArrayList vide et faire popper un agent toutes les 60 frames.
* Compléter notre classe agent en écrivant une fonction de wrapping : quand un agent sort de l’écran, il réapparait à l’opposé !


### Connaissances fondamentales :

* un boolean  est un type de variable. Il peut prendre deux valeur : true / 1 ou false / 0.

* le mot clé if permet de définir des conditions. Son utilisation se résume en trois étapes :
   * invocation du mot-clé if
   * entre parenthèse la condition que l’on souhaite tester : cette condition doit se résoudre par un type boolean 
   * entre accolade le code à exécuter si la condition est vérifiée. 

* la fonction dist prend quatre argument et nous renvoie la distance entre deux points sous la forme d’un flottant (soit deux couples de coordonnées).

* la variable frameCount est une variable globale de processing et elle stocke le nombre de frame calculées depuis le début de l'exécution du programme.

* les variables globales  width  et height stockent la taille de notre fenêtre de jeu.

### Ressources
https://processing.org/reference/boolean.html

https://processing.org/reference/if.html

https://processing.org/reference/dist_.html

https://processing.org/reference/frameCount.html

https://processing.org/reference/modulo.html

### Code
(TODO)

[^home](https://github.com/b2renger/processing_physics_game_workshop#contenu)<br>


## ÉTAPE 7 : Gameplay

### Missions :
* Créer deux ArrayList : un qui stockera les agents à attraper (dessinés en blanc) et un qui stockera les agents à ne pas attraper (dessinés en rouge)
* Faire popper des agents des deux types à intervalles réguliers mais différents.
* Créer une fonction de score : lorsque l’on attrape un agent blanc on marque des points, lorsque l’on attrape un agent rouge on perd des points
* Afficher le score.
* Jouer sur la fréquence de pop et évaluer la difficulté qui en résulte.


### Connaissance fondamentales :
* Vous savez déjà beaucoup de choses … Rien à signaler …


### Ressources
https://processing.org/reference/text_.html

### Code
(TODO)

[^home](https://github.com/b2renger/processing_physics_game_workshop#contenu)<br>



## ÉTAPE 8 : Niveaux

### Missions :
* Construire une progression avec différents niveaux qui s’enchaînent avec une difficulté croissante à l’aide d’une classe
* Déterminer une manière de perdre.
* Réaliser un écran de Game Over.
* Réaliser un écran de victoire.


### Astuce :
* Vous pouvez utiliser une variable de type int pour stocker le niveau ou l’écran auquel vous êtes. Par exemple si cette variable vaut 0 nous sommes à l’écran d’accueil du jeu, si elle vaut 1 nous sommes au niveau 1 etc.

* Vous pouvez tester cette variable avec des if et la modifier en fonction du déroulement du jeu (passer un niveau) ou des actions de l’utilisateur.


### Considérations :
* Est-ce que la vitesse de pop est un levier suffisant pour réaliser une progression ?
* Vous pourriez choisir par exemple d’atteindre un certain score pour passer au niveau supérieur. Ou vous pourriez décider qu’il faut manger une certains nombre d’agent.
* Vous pourriez imaginer avoir un système de vie pour perdre, ou perdre quand votre total de points et négatif.
* Est-ce que les ennemies disparaissent aussi ? ou restent-ils affichés ?
* Est-ce qu’il y a un nombre maximum d’ennemies ou d’agents dans un niveau ?

### Code 
(TODO)

[^home](https://github.com/b2renger/processing_physics_game_workshop#contenu)<br>


## ÉTAPE 9 : Son


### Missions :
* Ajouter une bande sonore à votre jeu
* Ajouter des effets sonores en fonction des action de jeu.
* Vous devez trouver des sons libres de droit ou les créer vous même !


### Ressources
https://processing.org/reference/libraries/sound/index.html
https://freesound.org/

### Code
(TODO)

[^home](https://github.com/b2renger/processing_physics_game_workshop#contenu)<br>


## ÉTAPE 10 : Aller plus loin …


Si vous avez réussi à atteindre cette étape : toutes nos félicitations ! Il est maintenant temps d’aller plus loin; il serait possible par exemple :


* ajouter des bonus/malus comme par exemple (augmenter la taille des ennemies / diminuer la taille bulles à attraper, augmenter / diminuer la taille du cercle qui attrape les bulles, accélérer / diminuer la vitesse de déplacement, faire poper des ennemis en plus …)
* d’utiliser des sprites (animés ou non) plutôt que des formes géométriques
* de contrôler le joueur avec les touches du clavier ou via un joystick ou une manette.
* de créer un système à particule pour égayer les collisions
* modifier le gameplay pour en faire un jeux à deux joueurs
* de déployer votre jeu sur android ! (processing dispose d'un excellent mode android permettant de déployer votre code directement sur votre téléphone ou tablette !)
* ou tout autre idée qui vous viendrait à l’esprit … n’hésitez pas à nous solliciter
