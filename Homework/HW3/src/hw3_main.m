% Hunter Phillips
% Problem 8 - (b) and (c)
% MAE 488
% 02/11/19

clc

%% Header
d_bullets = repmat('*', 50, 1); % concise way to make a lot of chars
fprintf('%c',d_bullets)
fprintf('\nMAE 488, Homework #3, Spring 2019, Hunter Phillips\n')
fprintf('%c',d_bullets)
fprintf('\n\n')

%% Problem 8 (b)


clear
clf

f1 = figure(1);

su_bullets = repmat('*', 25, 1); % setting up cmd line output
un_bullets = repmat('-', 25, 1);
fprintf('%c',su_bullets)
fprintf('\nProblem 8 - Part b\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

num   = [0 0 3];
denom = [4 28 24];
transfer_function = tf(num, denom)
t = 0:0.1:5;
x_t = (1/8) + (1/40)*(exp(-6*t))-(3/20)*(exp(-t));
[x_t_2, t2] = step(transfer_function,t);

% For Table Output
t_hand_calculated = t';
x_t_hand_calculated = x_t';
t_matlab_calculated = t2;
x_t_matlab_calculated = x_t_2;
Table_of_Values = table(t_hand_calculated,x_t_hand_calculated, t_matlab_calculated,x_t_matlab_calculated )


%% Problem 8 (c)
subplot(2,1,1)
plot(t2,x_t_2,'r-')
title({'MAE 488, Homework 3, Problem 8, Part c'})
legend('Matlab Calculated', 'location', 'southeast')
xlabel('Time (s)')
ylabel('Function x(t)')
subplot(2,1,2)
plot(t,x_t,'b-')
legend('Hand Calculated', 'location', 'southeast')
xlabel('Time (s)')
ylabel('Function x(t)')

%% print

% print(f1,'problem_8_c.png','-dpng','-r1200');