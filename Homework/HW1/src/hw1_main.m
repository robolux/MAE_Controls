% Hunter Phillips
% MAE488 - Homework 1
% Spring 2019
% Main
clear
clc

%% Header
d_bullets = repmat('*', 50, 1);
fprintf('%c',d_bullets)
fprintf('\nMAE 488, Homework #1, Spring 2019, Hunter Phillips\n')
fprintf('%c',d_bullets)
fprintf('\n\n')

%% Problem 2 - Part h
% Plot the displacement, velocity, and acceleration for 2 seconds
% (timestep of 0.001 seconds) in a single figure with each plot 
% in a subplot (displacement at the top, acceleration at the bottom).

su_bullets = repmat('*', 25, 1);
un_bullets = repmat('-', 25, 1);
fprintf('%c',su_bullets)
fprintf('\nProblem 2 - Part h\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

fprintf('%c',un_bullets)
fprintf('\nEquations Plotted\n')
fprintf('%c',un_bullets)
fprintf('\ny(t)   = 5sin(12t+0.5)\n')
fprintf('y''(t)  = 60cos(12t+0.5)\n')
fprintf('y''''(t) = -720sin(12t+0.5)\n')

fprintf('\nSolution Plotted in Figure 1\n\n\n')

p2_t         = 0:0.001:2;
displacement = 5*sin(12*p2_t+0.5);
velocity     = 60*cos(12*p2_t+0.5);
accel        = -720*sin(12*p2_t+0.5);

figure(1);

subplot(3,1,1)
plot(p2_t,displacement, 'r')
ylabel('Displacement y(t)')
xlabel('Time (s)')
title('MAE 488, Homework 1, Problem 2, Part h')

subplot(3,1,2)
plot(p2_t,velocity, '--g')
ylabel('Velocity y''(t)')
xlabel('Time (s)')

subplot(3,1,3)
plot(p2_t,accel, '.b');
ylabel('Acceleration y''''(t)')
xlabel('Time (s)')

%% Problem 3 - Part d
% Plot f(x) = (x)cos(x) from 0 to 10 coupled with linear approx curves

su_bullets = repmat('*', 25, 1);
un_bullets = repmat('-', 25, 1);
fprintf('%c',su_bullets)
fprintf('\nProblem 3 - Part d\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

fprintf('%c',un_bullets)
fprintf('\nEquations Plotted\n')
fprintf('%c',un_bullets)
fprintf('\nf(x) = xcos(x)\n')
fprintf('f(x) = (-1.4134)x + 1.2701\n')
fprintf('f(x) =  (5.0783)x - 23.9731\n')

fprintf('\nSolution Plotted in Figure 2\n\n\n')

p3_x = 0:0.001:10;
p3_x1 = 2:0.001:4;
p3_x2 = 4:0.001:6;
fun = p3_x.*cos(p3_x);
fun_b = (-1.4134)*p3_x1 + 1.2701;
fun_c = (5.0783)*p3_x2 - 23.9731;
point_b = (-1.4134)*3 + 1.2701;
point_c = (5.0783)*5 - 23.9731;

f2 = figure(2);
title('MAE 488, Homework 1, Problem 3, Part d')

hold on
plot(p3_x, fun, 'b')
plot(p3_x1, fun_b, 'g')
plot(p3_x2, fun_c, 'm')
plot(3, point_b, 'r*')
plot(5, point_c, 'g*')
hold off

ylabel('f(x)')
l_3 = legend('$f(x) = xcos(x)$', '$f_{linear}(x) \approx [-\hat{x}sin(\hat{x})+cos(\hat{x})]x + \hat{x}^{2}sin(\hat{x})\,\,\,\,\,\, at \,\,\hat{x} = \hat{x}_{1} = 3$'...
             ,'$f_{linear}(x) \approx [-\hat{x}sin(\hat{x})+cos(\hat{x})]x + \hat{x}^{2}sin(\hat{x})\,\,\,\,\,\, at \,\,\hat{x} = \hat{x}_{2} = 5$'...
             ,'$f_{linear}(x) \,\,\,at\,\,\, [\hat{x}_{1}, f_{linear}(\hat{x}_{1})] \,\,\,with\,\,\, \hat{x}_{1} = 3$'...
             ,'$f_{linear}(x) \,\,\,at\,\,\, [\hat{x}_{2}, f_{linear}(\hat{x}_{2})] \,\,\,with\,\,\, \hat{x}_{2} = 5$');
set(l_3, 'interpreter', 'latex')
l_3.FontSize = 12;
set(l_3,'Location','southwest')

%% Problem 4
% Plot data with linear, exponential, and power axis.

su_bullets = repmat('*', 25, 1);
un_bullets = repmat('-', 25, 1);
fprintf('%c',su_bullets)
fprintf('\nProblem 4\n')
fprintf('Each set of data is plotted with linear, exponential, and power axis.\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

% Part A

fprintf('%c',un_bullets)
fprintf('\nPart A - Figure 3\n')
fprintf('%c',un_bullets)
fprintf('\nx = [1 17.5 34 50.5 67 83.5 100]\n')
fprintf('y = [0.001 93.79 1336.3 6503.8 20151.1 48612.3 100000]\n\n')

figure(3);
x_4_a = [1 17.5 34 50.5 67 83.5 100];
y_4_a = [0.001 93.79 1336.3 6503.8 20151.1 48612.3 100000];

subplot(3,1,1)
plot(x_4_a,y_4_a, 'm')
ylabel('y (linear)')
xlabel('x')
title('MAE 488, Homework 1, Problem 4, Part a')

subplot(3,1,2)
semilogy(x_4_a,y_4_a, 'm')
ylabel('y (exponential)')
xlabel('x')

subplot(3,1,3)
loglog(x_4_a,y_4_a, 'm')
ylabel('y (power)')
xlabel('x')

% Part B

fprintf('%c',un_bullets)
fprintf('\nPart B - Figure 4\n')
fprintf('%c',un_bullets)
fprintf('\nx = [14.5 17 19.5 22 24.5 27 29.5]\n')
fprintf('y = [0 62.5 125 187.5 250 312.5 375]\n\n')

figure(4);
x_4_b = [14.5 17 19.5 22 24.5 27 29.5];
y_4_b = [0 62.5 125 187.5 250 312.5 375];

subplot(3,1,1)
plot(x_4_b,y_4_b, 'm')
ylabel('y (linear)')
xlabel('x')
title('MAE 488, Homework 1, Problem 4, Part b')

subplot(3,1,2)
semilogy(x_4_b,y_4_b, 'm')
ylabel('y (exponential)')
xlabel('x')

subplot(3,1,3)
loglog(x_4_b,y_4_b, 'm')
ylabel('y (power)')
xlabel('x')

% Part C

fprintf('%c',un_bullets)
fprintf('\nPart C - Figure 5\n')
fprintf('%c',un_bullets)
fprintf('\nx = [0.5 1 1.5 2 2.5 3 3.5]\n')
fprintf('y = [3.115 2.426 1.889 1.471 1.146 0.893 0.695]\n\n')

figure(5);
x_4_c = [0.5 1 1.5 2 2.5 3 3.5];
y_4_c = [3.115 2.426 1.889 1.471 1.146 0.893 0.695];

subplot(3,1,1)
plot(x_4_c,y_4_c, 'm')
ylabel('y (linear)')
xlabel('x')
title('MAE 488, Homework 1, Problem 4, Part c')

subplot(3,1,2)
semilogy(x_4_c,y_4_c, 'm')
ylabel('y (exponential)')
xlabel('x')

subplot(3,1,3)
loglog(x_4_c,y_4_c, 'm')
ylabel('y (power)')
xlabel('x')
