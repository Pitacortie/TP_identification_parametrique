# TP1 — Identification paramétrique

## Fichiers rendus

```text
TP1/
├── definit_param.m
└── simule_systeme.m
```

### `definit_param.m`

Ce script définit les paramètres utilisés pour la simulation du système mécanique :

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

Les variables `k0`, `k1` et `k2` correspondent aux constantes de raideur des ressorts, `b0`, `b1` et `b2` aux coefficients d’amortissement, et `m1`, `m2` et `m3` aux masses du système.

### `simule_systeme.m`

Ce script utilise les paramètres définis dans `definit_param.m` pour construire les fonctions de transfert du système sous MATLAB.

La variable de Laplace est créée avec :

```matlab
s = tf('s');
```

Les polynômes intermédiaires `F1` à `F7` sont ensuite définis puis utilisés pour calculer les trois fonctions de transfert :

```matlab
G1
G2
G3
```

Elles correspondent respectivement aux réponses associées aux déplacements `alpha`, `beta` et `gamma`.

La simulation est effectuée entre 0 et 8 secondes avec un pas de 0,01 s :

```matlab
t = 0:0.01:8;
```

Le script calcule ensuite les positions, vitesses et accélérations des trois degrés de liberté :

```text
alpha       vit_alpha       acc_alpha
beta        vit_beta        acc_beta
gamma       vit_gamma       acc_gamma
```

La force `f` est également reconstruite à partir des résultats de la simulation.

## Exécution

Ouvrir MATLAB et se placer dans le dossier `TP1`.

Exécuter d’abord :

```matlab
definit_param
```

puis :

```matlab
simule_systeme
```

Après l’exécution, les paramètres, les fonctions de transfert et les vecteurs de simulation sont disponibles directement dans le **Workspace MATLAB**.

Pour visualiser un signal, on peut par exemple utiliser :

```matlab
plot(t, alpha)
grid on
```

ou afficher plusieurs grandeurs :

```matlab
plot(t, alpha, t, beta, t, gamma)
grid on
legend('alpha', 'beta', 'gamma')
```

## Prérequis

- MATLAB
- Control System Toolbox (`tf`, `minreal`, `step`)
