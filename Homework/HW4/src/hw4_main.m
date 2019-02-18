% Hunter Phillips
% Problem 8 - (b),(c),(d),and (e)
% MAE 488
% 02/17/19

clc

%% Header
d_bullets = repmat('*', 50, 1); % concise way to make a lot of chars
fprintf('%c',d_bullets)
fprintf('\nMAE 488, Homework #4, Spring 2019, Hunter Phillips\n')
fprintf('%c',d_bullets)
fprintf('\n\n')

%% Problem 8 (b)


clear

su_bullets = repmat('*', 25, 1); % setting up cmd line output
un_bullets = repmat('-', 25, 1);
fprintf('%c',su_bullets)
fprintf('\nProblem 8 - Part b\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

% System of Equations from Work by Hand
syms X1 X2 s F
eqn_1 = (20*s*s + 9*(10^4))*X1 - (6*(10^4))*X2 - F;
eqn_2 = (-6*(10^4))*X1 + (60*s*s + 6*(10^4))*X2

[A,B] = equationsToMatrix([eqn_1, eqn_2], [X1, X2])
X = linsolve(A,B)



%% Problem 8 (c)

clf
f1 = figure(1);

sys = tf([1, 0, 1e+3],[20, 0, 1.1e+5, 0, 3e+7]);
step(sys)

title({'MAE 488, Homework 4, Problem 8, Part c'})
%legend('Matlab Calculated', 'location', 'southeast')
xlabel('Time (s)')
ylabel('Function x(t)')
% legend('Hand Calculated', 'location', 'southeast')
xlabel('Time (s)')
ylabel('Function x(t)')

%% print

% print(f1,'problem_8_c.png','-dpng','-r1200');