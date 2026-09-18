# TP1 - Identification paramétrique

Ce dossier contient les fichiers MATLAB réalisés pour le **TP1 d'identification d'un système mécanique linéaire**.

Le système étudié est composé de trois masses reliées par des ressorts et des amortisseurs. Le but du TP est de simuler le comportement du système puis d'identifier ses différents paramètres mécaniques à partir des mesures obtenues.

Les paramètres recherchés sont :

```matlab
x = [k0; k1; k2; b0; b1; b2; m1; m2; m3];
```

avec :

* `k0`, `k1`, `k2` : constantes de raideur en N/m ;
* `b0`, `b1`, `b2` : coefficients d'amortissement en Ns/m ;
* `m1`, `m2`, `m3` : masses en kg.

---

## Fichiers

### `definit_param.m`

Définit les paramètres réels du système mécanique utilisés pour la simulation.

Les valeurs initiales sont :

```matlab
k0 = 300;
k1 = 100;
k2 = 50;

b0 = 30;
b1 = 40;
b2 = 8;

m1 = 1;
m2 = 1;
m3 = 4;
```

Les paramètres réels sont regroupés dans le vecteur :

```matlab
x_reel = [k0;k1;k2;b0;b1;b2;m1;m2;m3];
```

---

### `simule_systeme.m`

Construit les fonctions de transfert du système mécanique puis simule sa réponse à un échelon unitaire de force.

La simulation est effectuée entre :

```matlab
t = 0:0.01:8;
```

soit entre **0 et 8 secondes** avec une mesure toutes les **10 ms**.

Les fonctions de transfert `G1`, `G2` et `G3` permettent respectivement d'obtenir les déplacements :

* `alpha`
* `beta`
* `gamma`

Le script génère également leurs dérivées :

```matlab
vit_alpha
vit_beta
vit_gamma
```

pour les vitesses et :

```matlab
acc_alpha
acc_beta
acc_gamma
```

pour les accélérations.

La force appliquée est stockée dans :

```matlab
f
```

---

### `affichage.m`

Permet d'afficher les signaux générés par la simulation.

Le script affiche dans une même fenêtre trois graphes :

1. les positions `alpha`, `beta` et `gamma` ;
2. les vitesses `vit_alpha`, `vit_beta` et `vit_gamma` ;
3. les accélérations `acc_alpha`, `acc_beta` et `acc_gamma`.

Lancement :

```matlab
affichage
```

---

### `identifie_parametre.m`

Réalise l'identification des paramètres mécaniques à partir des mesures simulées.

Le modèle d'identification est mis sous une forme linéaire :

```matlab
A*x = Y
```

avec :

```matlab
x = [k0;k1;k2;b0;b1;b2;m1;m2;m3];
```

Pour chaque instant sélectionné, les positions, vitesses et accélérations sont utilisées pour construire la matrice d'identification.

Les instants utilisés dans le programme sont définis par :

```matlab
list_idx = [5 10 50 100 150 200 300 500 700];
```

Les différentes matrices obtenues sont ensuite regroupées dans `A` et `Y`.

Les paramètres sont finalement estimés avec :

```matlab
x = A\Y;
```

Cette méthode permet d'utiliser plusieurs mesures simultanément pour identifier les neuf paramètres du système.

Le script prend également en compte la quantification des mesures et le filtrage lorsque ces options sont activées.

---

## Questions du TP

### `question1.m` - Identification sans quantification

Cette première partie réalise l'identification des paramètres à partir des données issues directement de la simulation.

Le programme :

1. initialise les paramètres réels ;
2. simule le système ;
3. construit le modèle d'identification ;
4. estime les paramètres ;
5. compare les paramètres identifiés aux paramètres réels ;
6. calcule l'erreur relative sur chaque paramètre.

L'erreur relative est calculée avec :

```matlab
(abs(x(k) - x_reel(k))/x_reel(k))*100
```

Les résultats sont affichés dans la **Command Window** de MATLAB.

Lancement :

```matlab
question1
```

---

### `question2.m` - Effet de la quantification

Cette partie reprend l'identification précédente en ajoutant une quantification des mesures afin de représenter la résolution limitée de capteurs réels.

Les pas de quantification utilisés sont :

```matlab
pos_q = 10e-6;
vit_q = 0.1e-3;
acc_q = 1e-3;
```

soit :

* **10 µm** pour les positions ;
* **0,1 mm/s** pour les vitesses ;
* **1 mm/s²** pour les accélérations.

Les mesures sont quantifiées à l'aide de la fonction MATLAB `round`.

Les paramètres identifiés sont ensuite comparés aux paramètres réels afin d'observer l'influence de la quantification sur la précision de l'identification.

Lancement :

```matlab
question2
```

---

### `question3.m` - Augmentation de `k1` et `b1`

Cette partie étudie le comportement de l'identification lorsque les valeurs de la raideur `k1` et de l'amortissement `b1` sont fortement augmentées.

Les nouvelles valeurs sont :

```matlab
k1 = 5000;
b1 = 400;
```

Les mesures restent quantifiées comme dans la question précédente.

Le programme réalise ensuite une nouvelle simulation et une nouvelle identification avant de comparer les paramètres estimés aux nouvelles valeurs réelles.

Lancement :

```matlab
question3
```

---

### `question4.m` - Filtrage des mesures

Cette dernière partie ajoute un filtrage des données quantifiées avant leur utilisation pour l'identification.

Le filtrage est activé avec :

```matlab
filter = true;
```

et le coefficient utilisé dans le fichier actuel est :

```matlab
u = 0.999;
```

Le filtrage est réalisé avec la fonction :

```matlab
filtfilt([1 u-1], u, x);
```

L'utilisation de `filtfilt` permet d'appliquer le filtre sans introduire de déphasage dans le signal.

Le but est d'étudier si le filtrage des mesures quantifiées permet d'améliorer la qualité de l'identification.

Lancement :

```matlab
question4
```

---

## Utilisation

Ouvrir MATLAB puis placer le **Current Folder** dans le dossier :

```text
TP1
```

### Simulation seule

```matlab
run("definit_param.m");
run("simule_systeme.m");
```

### Affichage des signaux

```matlab
affichage
```

### Identification

Les différentes parties du TP peuvent être lancées avec :

```matlab
question1
question2
question3
question4
```

Les paramètres identifiés ainsi que les erreurs relatives sont affichés directement dans la **Command Window**.

---

## Organisation du TP

L'enchaînement général du travail est :

```text
Définition des paramètres
        |
        v
Simulation du système
        |
        v
Positions / Vitesses / Accélérations
        |
        v
Construction de A et Y
        |
        v
Identification des paramètres
        |
        v
Comparaison avec les paramètres réels
```

Les différentes questions permettent ensuite d'étudier l'influence :

```text
Question 1 : identification sur les données simulées
Question 2 : ajout de la quantification
Question 3 : augmentation de k1 et b1
Question 4 : ajout d'un filtrage
```

---

## Prérequis

Le projet nécessite **MATLAB** ainsi que les fonctions utilisées pour :

* la manipulation des fonctions de transfert (`tf`, `minreal`) ;
* la simulation des réponses (`step`) ;
* le filtrage des signaux (`filtfilt`).

---

## Auteurs

**Antoine El Kahi**
**Noah Gavard**

Polytech Sorbonne — ROB5
