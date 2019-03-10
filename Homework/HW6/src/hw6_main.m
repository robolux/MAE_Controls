% Hunter Phillips
% Homework 6
% MAE 488
% 03/10/19

clc
clear
format compact

%% Header
d_bullets = repmat('*', 50, 1); % concise way to make a lot of chars
fprintf('%c',d_bullets)
fprintf('\nMAE 488, Homework #6, Spring 2019, Hunter Phillips\n')
fprintf('%c',d_bullets)
fprintf('\n\n')

clear

%% Problem 8M

su_bullets = repmat('*', 25, 1); % setting up cmd line output
fprintf('\n\n')
fprintf('%c',su_bullets)
fprintf('\nProblem 8M\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

% X(s)/F(s) 
sys1=tf(4,[1,0]); 
sys2=feedback(tf(1,[1,0]),8); 
sys3=series(sys1,sys2); 
sys4=feedback(sys3,6);
X_s_F_s = sys4

% X(s)/G(s) 
sys4=sys2; 
sys5=series(24,tf(1,[1,0])); 
sys6=-feedback(sys4,sys5);
X_s_G_s = sys6


%% Problem 9M

su_bullets = repmat('*', 25, 1); 
fprintf('\n\n')
fprintf('%c',su_bullets)
fprintf('\nProblem 9M\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

% C(s)/R(s)
sys1=tf([4,10],[3,1]); 
sys2=tf(1,[7,1]); 
sys3=series(sys1,sys2); 
sys4=feedback(sys3,1);
C_s_R_s = sys4

% C(s)/D(s) 
sys5=-feedback(sys2,sys1);
X_s_G_s = sys5

%% Problem 23M (b)

su_bullets = repmat('*', 25, 1);
fprintf('\n\n')
fprintf('%c',su_bullets)
fprintf('\nProblem 23M (b)\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

A = [-5, 3; 1, -4]; 
B = [4, 0;0, 5]; 
C = [1, 0]; 
D = [0, 0];
sys = ss(A,B,C,D);

fprintf('X_1(s)/U_1(s) is from input 1 to output\n')
fprintf('X_1(s)/U_2(s) is from input 2 to output\n')

transfer_fun = tf(sys)

%% Problem 25M (b)

su_bullets = repmat('*', 25, 1);
fprintf('\n\n')
fprintf('%c',su_bullets)
fprintf('\nProblem 25M (b)\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

sys1 = tf([1, 2], [1, 4, 3]);
sys2 = ss(sys1)

fprintf('The model is:\n')
fprintf('z_1'' = %.0f*z_1 %.1f*z_2 + %.0f*f\n',sys2.A(1), sys2.A(3), sys2.B(1))
fprintf('z_2'' = %.0f*z_1\n', sys2.A(2))
fprintf('  y  = %.1f*z_1 + %.1f*z_2\n', sys2.C(1), sys2.C(2))

%% Problem 35M

f1 = figure(1);
su_bullets = repmat('*', 25, 1);
fprintf('\n\n')
fprintf('%c',su_bullets)
fprintf('\nProblem 35M\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

[t,v] = ode45('problem35',[0, 7], 0);
plot(t,v)
xlabel('t (sec)')
ylabel('v (ft/sec)')
title({'MAE 488, Homework 6, Problem 6.35M'},'interpreter','latex')
ylim([0 275])

fprintf('Results Plotted in Figure 1\n')
% print(f1,'..\results\problem_5_35M.png','-dpng','-r1200');

%% Problem 41S

f2 = figure(2);

su_bullets = repmat('*', 25, 1);
fprintf('\n\n')
fprintf('%c',su_bullets)
fprintf('\nProblem 41S\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

sim('problem_41s')

plot(simout.time, simout.data,'r')
title({'MAE 488, Homework 6, Problem 6.41S'},'interpreter','latex')
xlabel('t')
ylabel('y(t)')

fprintf('Results Plotted in Figure 2\n')
% print(f2,'..\results\problem_5_41S.png','-dpng','-r1200');

%% Problem 45S

f3 = figure(3);

su_bullets = repmat('*', 25, 1);
fprintf('\n\n')
fprintf('%c',su_bullets)
fprintf('\nProblem 45S\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

A_45s = [-5, 3; 0 -4]
B_45s = [2;0]
C_45s = [1, 3; 0, 1]
D_45s = [2;0]

sim('problem_45s')

plot(simout.time, simout.data)
title({'MAE 488, Homework 6, Problem 6.45S'},'interpreter','latex')
xlabel('t')
legend('y_1(t)','y_2(t)','location','southeast','fontsize',16)
ylim([-2 3])

fprintf('\nResults Plotted in Figure 3\n')
% print(f3,'..\results\problem_5_45S.png','-dpng','-r1200');


%% Problem 46S

f4 = figure(4);

su_bullets = repmat('*', 25, 1);
fprintf('\n\n')
fprintf('%c',su_bullets)
fprintf('\nProblem 46S\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

A_45s = [-5, 3; 0 -4]
B_45s = [0;0]
C_45s = [1, 3; 0, 1]
D_45s = [0;0]

sim('problem_46s')

plot(simout.time, simout.data)
title({'MAE 488, Homework 6, Problem 6.46S'},'interpreter','latex')
xlabel('t')
legend('y_1(t)','y_2(t)','location','northeast','fontsize',16)
ylim([-1 15])
grid

fprintf('\nResults Plotted in Figure 4\n')
% print(f4,'..\results\problem_5_46S.png','-dpng','-r1200');

%% Problem 28M

format long
f5 = figure(5);

su_bullets = repmat('*', 25, 1);
fprintf('\n\n')
fprintf('%c',su_bullets)
fprintf('\nProblem 28M\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

% part a
m1 = 36;
m2 = 240;
k1 = 1.6e+5;
k2 = 1.6e+4;
c1 = 98; 

A = [0, 1, 0, 0; -k1/m1, -c1/m1, k1/m1, c1/m1; ...
     0, 0, 0, 1; k1/m2, c1/m2, -(k1+k2)/m2, -c1/m2]; 
B = [0; 0; 0; k2/m2];
C = [1, 0, 0, 0; 0, 0, 1, 0]; 
D = [0; 0];

fprintf('Part A\n-------\n')
sys = ss(A,B,C,D)

% part b
fprintf('\nPart B\n-------\n\n')
fprintf('Results Plotted in Figure 5\n\n')
impulse(sys)
title({'MAE 488, Homework 6, Problem 5.28M'},'interpreter','latex')


% part c
fprintf('\nPart C\n-------\n\n')
% print(f5,'..\results\problem_5_28M.png','-dpng','-r1200');

% characteristic polynomial
po = poly(A);
fprintf('Characteristic Polynomial:\n')
fprintf('%.2fs^4 + %.2fs^3 + %.2fs^2 + %.2fs^1 + %.2f = 0\n\n'...
        ,po(1), po(2), po(3), po(4), po(5))

% roots
roots = eig(A)

% part d
fprintf('\n\nPart D\n-------\n\n')
tfsys = tf(sys);
X1_s_Y_s = tfsys(1)
X2_s_Y_s = tfsys(2)
