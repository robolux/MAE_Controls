% Hunter Phillips
% Homework 8
% MAE 488
% 04/02/19

clc
clear
format compact

%% Header
d_bullets = repmat('*', 50, 1); % concise way to make a lot of chars
fprintf('%c',d_bullets)
fprintf('\nMAE 488, Homework #8, Spring 2019, Hunter Phillips\n')
fprintf('%c',d_bullets)
fprintf('\n\n')

clear

%% Problem 29 Plots

f1 = figure(1);
hold on

% w(t)

% Part 1
kI = 160;
k2 = 34;
fun = tf([kI],[2 (2+k2), kI]);
[y1,x1] = step(fun,1.25);
info_1 = stepinfo(fun)
plot(x1,y1,'b')

% Part 2;
kI = 400;
k2 = 58;
fun = tf([kI],[2 (2+k2), kI]);
[y2,x2] = step(fun,1.25);
info_2 = stepinfo(fun)
plot(x2,y2,'g')

kI = 1000;
k2 = 118;
fun = tf([kI],[2 (2+k2), kI]);
[y3,x3] = step(fun,1.25);
info_3 = stepinfo(fun)
plot(x3,y3,'m')

ylim([0 1.2])
xlim([0 1.25])

ylabel('\omega(t)','FontSize', 18)
xlabel('t','interpreter','tex','FontSize', 18)
title({'MAE 488, Homework 8, Problem 10.29 Part (b)1'},'interpreter','latex','FontSize',16)

legend('s=-10,-8','s=-10,-20','s=-10,-50','location','southeast','fontsize',16)
grid

% print(f1,'..\results\problem_10_29_1.png','-dpng','-r1200');

% T

f2 = figure(2);
hold on
grid

% Part 1
kI = 160;
k2 = 34;
fun = tf([(2*kI) (2*kI)],[2 (2+k2), kI]);
[y1,x1] = step(fun,1);
info_4 = stepinfo(fun)
plot(x1,y1,'r')

% Part 2
kI = 400;
k2 = 58;
fun = tf([(2*kI) (2*kI)],[2 (2+k2), kI]);
[y1,x1] = step(fun,1);
info_5 = stepinfo(fun)
plot(x1,y1,'g')

% Part 3
kI = 1000;
k2 = 118;
fun = tf([(2*kI) (2*kI)],[2 (2+k2), kI]);
[y1,x1] = step(fun,1);
info_6 = stepinfo(fun)
plot(x1,y1,'b')

ylabel('\tau(t)','FontSize', 18)
xlabel('t','interpreter','tex','FontSize', 18)
title({'MAE 488, Homework 8, Problem 10.29 Part (b)2'},'interpreter','latex','FontSize',16)

ylim([0 15])

legend('s=-10,-8','s=-10,-20','s=-10,-50','location','northeast','fontsize',16)

% print(f2,'..\results\problem_10_29_2.png','-dpng','-r1200');

%% Problem 73S

f3 = figure(3);

KP = 108;
KI = 200;
sim('hw8_73S.slx')

subplot(2,1,1),plot(tout,simout(:,2))
ylim([0 1.5])
ylabel('\omega(t)','FontSize', 18)
xlabel('t','interpreter','tex','FontSize', 18)
title({'MAE 488, Homework 8, Problem 10.73S'},'interpreter','latex','FontSize',16)
grid

subplot(2,1,2),plot(tout,simout(:,1),'r')
ylim([0,25])
ylabel('\tau(t)','FontSize', 18)
xlabel('t','interpreter','tex','FontSize', 18)
grid

% print(f3,'..\results\problem_10_73S.png','-dpng','-r1200');

