# TP1 - Identification paramétrique

## Fichiers

### `definit_param.m`

Définit les paramètres réels du système mécanique utilisés pour la simulation :

- `k0`, `k1`, `k2` : constantes de raideur en N/m
- `b0`, `b1`, `b2` : coefficients d'amortissement en Ns/m
- `m1`, `m2`, `m3` : masses en kg

Les paramètres sont regroupés dans :

```matlab
x_reel = [k0;k1;k2;b0;b1;b2;m1;m2;m3];
```

### `simule_systeme.m`

Construit les fonctions de transfert du système puis simule sa réponse à un échelon unitaire de force entre 0 et 8 s avec un pas de 0,01 s.

Le script génère :

- `alpha`, `beta`, `gamma` : positions
- `vit_alpha`, `vit_beta`, `vit_gamma` : vitesses
- `acc_alpha`, `acc_beta`, `acc_gamma` : accélérations
- `f` : force appliquée
- `t` : vecteur temps

### `identifie_parametre.m`

Construit le modèle linéaire utilisé pour identifier les paramètres :

```matlab
x = [k0;k1;k2;b0;b1;b2;m1;m2;m3];
```

À partir de plusieurs instants de mesure, le script construit les matrices `A` et `Y`, puis calcule les paramètres identifiés avec :

```matlab
x = A\Y;
```

Le script peut utiliser les mesures simulées directement ou leur version quantifiée lorsque `quanti` est activé.

### `question_1.m`

Exécute l'identification à partir des données simulées sans quantification.

Le script charge les paramètres, simule le système, identifie les paramètres, affiche les valeurs trouvées puis calcule l'erreur relative par rapport aux paramètres réels.

Lancement :

```matlab
question_1
```

### `question_2.m`

Reprend l'identification en ajoutant la quantification des mesures avec :

```matlab
pos_q = 10e-6;
vit_q = 0.1e-3;
acc_q = 1e-3;
```

Lancement :

```matlab
question_2
```

### `question_3.m`

Reprend l'identification avec quantification en utilisant :

```matlab
k1 = 5000;
b1 = 400;
```

Les paramètres identifiés et les erreurs relatives sont ensuite affichés dans la Command Window.

Lancement :

```matlab
question_3
```

### `affichage.m`

Affiche les signaux générés par la simulation dans une seule fenêtre contenant trois graphes :

1. positions `alpha`, `beta`, `gamma` ;
2. vitesses `vit_alpha`, `vit_beta`, `vit_gamma` ;
3. accélérations `acc_alpha`, `acc_beta`, `acc_gamma`.

Lancement :

```matlab
affichage
```

## Utilisation

Dans MATLAB, placer le **Current Folder** dans le dossier `TP1`.

Pour lancer uniquement la simulation :

```matlab
run("definit_param.m");
run("simule_systeme.m");
```

Pour afficher les signaux :

```matlab
affichage
```

Pour lancer les différentes identifications :

```matlab
question_1
question_2
question_3
```

Les paramètres identifiés et les erreurs relatives sont affichés directement dans la **Command Window** de MATLAB.
