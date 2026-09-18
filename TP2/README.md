# TP2 - Identification paramétrique

Ce dossier contient les fichiers MATLAB utilisés pour le **TP2 d'identification paramétrique**.

Le travail porte sur l'identification des paramètres dynamiques de deux axes à partir de relevés expérimentaux. Les scripts utilisent les positions, vitesses et courants moteurs mesurés afin d'estimer les paramètres du modèle par une méthode de moindres carrés.

---

## Fichiers

### `ident_axe1_v_cste.m`

Réalise l'identification des paramètres de l'**axe 1** à partir du relevé expérimental effectué à vitesse constante.

Le script charge :

```matlab
releve_vit_cste_axe1.mat
```

Les constantes connues utilisées sont :

```matlab
kc1 = 0.0525;
N1 = 20.25;
```

La matrice d'identification est construite à partir de :

```matlab
[cos(q1)  sign(qp1)  qp1  1]
```

et le couple moteur est obtenu avec :

```matlab
N1 * kc1 * i1
```

Les paramètres sont estimés par moindres carrés avec :

```matlab
p1 = (A' * A) \ (A' * y);
```

Le programme affiche également :

- la taille de la matrice `A` et du vecteur `y` ;
- le rang de `A` ;
- le conditionnement de `A` ;
- les paramètres estimés ;
- une comparaison graphique entre les mesures et le modèle identifié ;
- un QQ-plot des résidus ;
- une comparaison entre `y` et la sortie estimée `A*p1`.

Lancement :

```matlab
ident_axe1_v_cste
```

---

### `ident_axe1_v_cste_filtre.m`

Reprend l'identification de l'**axe 1**, mais en utilisant les données filtrées contenues dans le fichier de mesure.

Les variables principales utilisées sont :

```matlab
qpfil1
ifil1
```

La matrice d'identification est alors construite à partir de la vitesse filtrée et le couple est calculé à partir du courant filtré.

Les paramètres identifiés sont stockés dans :

```matlab
p1fil
```

Lancement :

```matlab
ident_axe1_v_cste_filtre
```

---

### `ident_axe2_v_cste.m`

Réalise l'identification des paramètres de l'**axe 2** à partir du relevé expérimental à vitesse constante.

Le script charge :

```matlab
releve_vit_cste_axe2.mat
```

Les constantes connues utilisées pour l'axe 2 sont :

```matlab
kc2 = 0.0525;
N2 = 4.5;
```

La matrice d'identification est construite avec :

```matlab
[cos(q2)  sign(qp2)  qp2  1]
```

et le couple moteur est calculé avec :

```matlab
N2 * kc2 * i2
```

Les paramètres sont estimés par :

```matlab
p2 = (A' * A) \ (A' * y);
```

Comme pour l'axe 1, le script affiche les caractéristiques de la matrice d'identification et plusieurs graphes permettant d'évaluer la qualité du modèle obtenu.

Lancement :

```matlab
ident_axe2_v_cste
```

---

### `ident_axe2_v_cste_filtre.m`

Effectue l'identification de l'**axe 2 à partir des données filtrées**.

Les variables filtrées utilisées sont notamment :

```matlab
qpfil2
ifil2
```

Les paramètres estimés sont stockés dans :

```matlab
p2_fil
```

Lancement :

```matlab
ident_axe2_v_cste_filtre
```

---

### `ident_combine.m`

Ce script est destiné à l'identification du modèle complet à partir de mouvements combinés des deux axes.

Il charge :

```matlab
releve_mvts_combines.mat
```

Le principe est d'utiliser les paramètres obtenus lors des identifications à vitesse constante, puis de construire une nouvelle matrice d'identification pour déterminer les paramètres restant liés au comportement dynamique du système.

Le script prévoit ensuite de reconstruire séparément :

- le couple d'inertie ;
- le couple centrifuge ;
- le couple de gravité ;
- le couple de frottement ;
- le couple total du modèle.

Les couples reconstruits sont ensuite comparés aux couples mesurés et filtrés pour les deux axes.

Dans la version actuelle du dépôt, plusieurs expressions sont encore indiquées par :

```matlab
??
```

Le script doit donc encore être complété avant de pouvoir être exécuté entièrement.

---

## Données expérimentales

### `releve_vit_cste_axe1.mat`

Contient les mesures expérimentales utilisées pour identifier l'axe 1 à vitesse constante.

On y trouve notamment les positions, vitesses, courants moteurs et versions filtrées des signaux.

---

### `releve_vit_cste_axe2.mat`

Contient les mesures expérimentales utilisées pour identifier l'axe 2 à vitesse constante.

---

### `releve_mvts_combines.mat`

Contient les mesures réalisées lors de mouvements combinés des deux axes.

En plus des positions, vitesses et courants, ce fichier contient également les accélérations et leurs versions filtrées, utilisées pour l'identification dynamique complète.

---

## Principe de l'identification

Pour les essais à vitesse constante, le modèle est écrit sous une forme linéaire :

```text
A p = y
```

avec :

- `A` : matrice construite à partir des mesures de position et de vitesse ;
- `p` : vecteur des paramètres à identifier ;
- `y` : couple moteur calculé à partir du courant mesuré.

Les paramètres sont déterminés par la méthode des moindres carrés :

```matlab
p = (A' * A) \ (A' * y);
```

Les versions filtrées permettent ensuite de comparer les résultats obtenus avec les données brutes et d'étudier l'influence du filtrage sur l'identification.

---

## Utilisation

Ouvrir MATLAB puis placer le **Current Folder** dans le dossier :

```text
TP2
```

Pour identifier l'axe 1 :

```matlab
ident_axe1_v_cste
```

Puis avec les données filtrées :

```matlab
ident_axe1_v_cste_filtre
```

Pour identifier l'axe 2 :

```matlab
ident_axe2_v_cste
```

Puis avec les données filtrées :

```matlab
ident_axe2_v_cste_filtre
```

Le script d'identification combinée pourra être lancé après avoir complété les expressions manquantes dans `ident_combine.m`.

---

## Organisation du TP

```text
Relevés expérimentaux à vitesse constante
                |
                v
      Identification axe 1
                |
        données brutes / filtrées
                |
                v
      Identification axe 2
                |
        données brutes / filtrées
                |
                v
     Mouvements combinés des axes
                |
                v
 Identification du modèle dynamique complet
```

---

## Prérequis

Le projet nécessite **MATLAB** et les fonctions utilisées pour :

- le calcul matriciel ;
- l'estimation par moindres carrés ;
- l'affichage graphique ;
- l'analyse des résidus avec `qqplot`.

---

## Auteurs

**Antoine El Kahi**  
**Noah Gavard**

Polytech Sorbonne — ROB5
