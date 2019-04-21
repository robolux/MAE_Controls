% Hunter Phillips
% Homework 9
% MAE 488
% 04/17/19

clc
clear
format compact

%% Header
d_bullets = repmat('*', 50, 1); % concise way to make a lot of chars
fprintf('%c',d_bullets)
fprintf('\nMAE 488, Homework #9, Spring 2019, Hunter Phillips\n')
fprintf('%c',d_bullets)
fprintf('\n\n')

clear

%% Problem 11.2M

su_bullets = repmat('*', 25, 1); % setting up cmd line output
un_bullets = repmat('-', 25, 1);
fprintf('%c',su_bullets)
fprintf('\nProblem 11.2M\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

f1 = figure(1);
hold on

% Root Locus Plot
num = [1 0];
den = [3 0 12];
h = tf(num,den)
rlocus(h)

title({'MAE 488, Homework 9, Problem 11.2M'},'interpreter','latex','FontSize',16)


print(f1,'..\results\problem_11_2.png','-dpng','-r1200');

%% Problem 11.6M

su_bullets = repmat('*', 25, 1); % setting up cmd line output
un_bullets = repmat('-', 25, 1);
fprintf('%c',su_bullets)
fprintf('\nProblem 11.6M\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

% Multiply Gp_s and Gc_s as given to obtain:
Gc_Gp_s = tf([1 12 30 100],[1 3 2 0])
poles_a = pole(Gc_Gp_s)
zeros_a = zero(Gc_Gp_s)

fprintf('K = (TD)(KP) = 0.5KP\n\n')

% Finding closed-loop transfer function

modifi = series(Gc_Gp_s,10);    % Kp
modifi_2 = series(modifi,0.5);  % 0.5
Ys_Rs = feedback(modifi_2,1)    % closed loop feedback

poles_c = pole(Ys_Rs)
zeros_c = zero(Ys_Rs)


%% Problem 11.9M

su_bullets = repmat('*', 25, 1); % setting up cmd line output
un_bullets = repmat('-', 25, 1);
fprintf('%c',su_bullets)
fprintf('\nProblem 11.9M\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

f2 = figure(2);
hold on

% Rearranging results in:
% 1 + (5p/4)*((s^2+6s+8)/(s(s^2+(25/4)s+4)))=0
t_fun = tf([1 6 8],[1 (25/4) 4 0])
poles_9_b = pole(t_fun)
zeros_9_b = zero(t_fun)
rlocus(t_fun)
ylim([-3 3])
title({'MAE 488, Homework 9, Problem 11.9M'},'interpreter','latex','FontSize',16)

print(f2,'..\results\problem_11_9.png','-dpng','-r1200');


%% Problem 11.45M

su_bullets = repmat('*', 25, 1); % setting up cmd line output
un_bullets = repmat('-', 25, 1);
fprintf('%c',su_bullets)
fprintf('\nProblem 11.45M\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

f3 = figure(3);
hold on

% Solving mass spring damper system for equations of motion
% 2x'' + 8x' + (k2+26)*x = (k2)*y
% CE = 2s^2 + 8s + 26 + k2 = 0
% Standard form = 1 + ((k2)/2)(1/(s^2+4s+13) = 0
tfunn = tf([1],[1 4 13])
rlocus(tfunn)
title({'MAE 488, Homework 9, Problem 11.45M'},'interpreter','latex','FontSize',16)

largest_damp_ratio = cos(atan(3/2)) % info from pole on plot for 2 and 3

print(f3,'..\results\problem_11_45.png','-dpng','-r1200');

%% Problem 11.59S

su_bullets = repmat('*', 25, 1); % setting up cmd line output
un_bullets = repmat('-', 25, 1);
fprintf('%c',su_bullets)
fprintf('\nProblem 11.59S\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

% Gp(s) = 1/(s+4)
% Kp = 6    tau = 0.2
% KI = 50   zeta = 0.707
% (a) Construct a Simulink model to simulate this system with a unit-step command

sim('hw9_11_59_a.slx')

f4 = figure;
plot(actuator_output.time,actuator_output.signals.values)
title({'MAE 488, Homework 9, Problem 11.59S (a), Actuator Output vs Time'},'interpreter','latex','FontSize',16)
grid

f5 = figure;
plot(error.time,error.signals.values)
title({'MAE 488, Homework 9, Problem 11.59S (a), Error vs Time'},'interpreter','latex','FontSize',16)
grid

f6 = figure;
plot(output_response.time,output_response.signals.values)
title({'MAE 488, Homework 9, Problem 11.59S (a), Output Response vs Time'},'interpreter','latex','FontSize',16)
grid

f7 = figure;
plot(p_term.time,p_term.signals.values)
title({'MAE 488, Homework 9, Problem 11.59S (a), P Term vs Time'},'interpreter','latex','FontSize',16)
grid

f8 = figure;
plot(i_term.time,i_term.signals.values)
title({'MAE 488, Homework 9, Problem 11.59S (a), I Term vs Time'},'interpreter','latex','FontSize',16)
grid


% (b) Construct a Simulink model of an anti-windup system for this application

sim('hw9_11_59_b.slx')

f9 = figure;
plot(output_response_b.time,output_response_b.signals.values, 'r')
title({'MAE 488, Homework 9, Problem 11.59S (b), Output Response vs Time'},'interpreter','latex','FontSize',16)
grid

f10 = figure;
plot(actuator_output.time,actuator_output.signals.values, 'r')
title({'MAE 488, Homework 9, Problem 11.59S (b), Actuator Output vs Time'},'interpreter','latex','FontSize',16)
grid

% print(f4,'..\results\problem_11_59S_4.png','-dpng','-r1200');
% print(f5,'..\results\problem_11_59S_5.png','-dpng','-r1200');
% print(f6,'..\results\problem_11_59S_6.png','-dpng','-r1200');
% print(f7,'..\results\problem_11_59S_7.png','-dpng','-r1200');
% print(f8,'..\results\problem_11_59S_8.png','-dpng','-r1200');
% print(f9,'..\results\problem_11_59S_9.png','-dpng','-r1200');
% print(f10,'..\results\problem_11_59S_10.png','-dpng','-r1200');
