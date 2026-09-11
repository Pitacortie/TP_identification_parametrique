clear;
clc;
close all;

run("definit_param.m");
run("simule_systeme.m");

figure;

subplot(3,1,1)
plot(t, alpha, 'LineWidth', 1.2)
hold on
plot(t, beta, 'LineWidth', 1.2)
plot(t, gamma, 'LineWidth', 1.2)
grid on
title('Positions')
xlabel('Temps (s)')
ylabel('Position (m)')
legend('alpha', 'beta', 'gamma')

subplot(3,1,2)
plot(t, vit_alpha, 'LineWidth', 1.2)
hold on
plot(t, vit_beta, 'LineWidth', 1.2)
plot(t, vit_gamma, 'LineWidth', 1.2)
grid on
title('Vitesses')
xlabel('Temps (s)')
ylabel('Vitesse (m/s)')
legend('vit alpha', 'vit beta', 'vit gamma')

subplot(3,1,3)
plot(t, acc_alpha, 'LineWidth', 1.2)
hold on
plot(t, acc_beta, 'LineWidth', 1.2)
plot(t, acc_gamma, 'LineWidth', 1.2)
grid on
title('Accelerations')
xlabel('Temps (s)')
ylabel('Acceleration (m/s^2)')
legend('acc alpha', 'acc beta', 'acc gamma')