clear all;
close all;
run ("identifie_parametre.m");

disp("parametre trouve: ")
disp(x);

disp("Erreur avec les parametres réel:");
x_err = [];
for k=1:size(x)
    x_err = [x_err;(abs(x(k) - x_reel(k))/x_reel(k))*100];
end

disp(x_err);
