

%%Definicient des Polynomes%%
s = tf('s');

F1 = m1 *s *s +(b0 + b1) * s + k0 + k1;
F2 = -(b1 * s + k1);
F3 = F2;
F4 = m2 * s * s + k1 + b1 * s + k2 + b2 * s;
F5 = -(b2*s+k2);
F6 = F5;
F7 = k2 + b2 * s + m3 * s * s;

%Definition des Fonctions de transfert%

G1 = minreal(1/(F1 - F3*F2/(F4 -(F6*F5/F7))));
G2 = minreal(-F3/(F4 -(F6*F5/F7)) * G1);
G3 = minreal(-F6/F7 * G2);

%Generation des positions et des vitesses

t = 0:0.01:8;

alpha = step(G1, t);
vit_alpha = step(G1 * s, t);
acc_alpha = step(G1 *s *s , t);


beta = step(G2, t);
vit_beta = step(G2 * s, t);
acc_beta = step(G2 * s * s, t);


gamma = step(G3, t);
vit_gamma = step(G3 * s, t);
acc_gamma = step(G3 * s * s, t);

f = ones(size(alpha));