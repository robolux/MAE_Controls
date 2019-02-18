% Hunter Phillips
% Problem 8 - (b),(c),(d),and (e)
% MAE 488
% 02/17/19

clc
format compact

%% Header
d_bullets = repmat('*', 50, 1); % concise way to make a lot of chars
fprintf('%c',d_bullets)
fprintf('\nMAE 488, Homework #4, Spring 2019, Hunter Phillips\n')
fprintf('%c',d_bullets)
fprintf('\n\n')

%% Problem 8 (b)

clear

su_bullets = repmat('*', 25, 1); % setting up cmd line output
fprintf('%c',su_bullets)
fprintf('\nProblem 8 - Part b\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

% System of Equations from Work by Hand
syms X1 X2 s F
eqn_1 = (20*s*s + 9*(10^4))*X1 - (6*(10^4))*X2 - F
fprintf('\n')
eqn_2 = (-6*(10^4))*X1 + (60*s*s + 6*(10^4))*X2
fprintf('\n')

[A,B] = equationsToMatrix([eqn_1, eqn_2], [X1, X2]);
X = linsolve(A,B)

%% Problem 8 (c)

su_bullets = repmat('*', 25, 1); % setting up cmd line output
fprintf('\n\n')
fprintf('%c',su_bullets)
fprintf('\nProblem 8 - Part c\n')
fprintf('%c',su_bullets)
fprintf('\n')

f1 = figure(1);

transfer_fun_x1 = tf([1, 0, 1e+3],[20, 0, 1.1e+5, 0, 3e+7])
step(transfer_fun_x1, 0:0.001:5)

title({'MAE 488, Homework 4, Problem 8, Part c'})
xlabel('Time')
ylabel('Unit Step Response of x_1')

% print(f1,'../results/problem_8_c.png','-dpng','-r1200');

%% Problem 8 (d)

su_bullets = repmat('*', 25, 1); % setting up cmd line output
fprintf('\n')
fprintf('%c',su_bullets)
fprintf('\nProblem 8 - Part d\n')
fprintf('%c',su_bullets)
fprintf('\n')

f2 = figure(2);

transfer_fun_x2 = tf([1e+3],[20, 0, 1.1e+5, 0, 3e+7])
step(transfer_fun_x2, 0:0.001:5)

title({'MAE 488, Homework 4, Problem 8, Part d'})
xlabel('Time')
ylabel('Unit Step Response of x_2')

% print(f2,'../results/problem_8_d.png','-dpng','-r1200');

%% Problem 8 (e)

f3 = figure(3);

step(transfer_fun_x1, 0:0.0001:3)
hold on
step(transfer_fun_x2, 0:0.0001:3)

lgd = legend('Unit Step Response of $x\_1$', 'Unit Step Response of $x\_2$','FontSize', 20);
set(lgd,'Interpreter','latex')
title({'MAE 488, Homework 4, Problem 8, Part e'},'FontSize', 20)
xlabel('Time','FontSize', 20)
ylabel('Amplitude','FontSize', 20)
set(gcf, 'Position',  [0, 0, 1500, 1300])

% print(f3,'../results/problem_8_e.png','-dpng','-r1200');

