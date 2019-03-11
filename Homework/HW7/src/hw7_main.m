% Hunter Phillips
% Homework 7
% MAE 488
% 03/10/19

clc
clear
format compact

%% Header
d_bullets = repmat('*', 50, 1); % concise way to make a lot of chars
fprintf('%c',d_bullets)
fprintf('\nMAE 488, Homework #7, Spring 2019, Hunter Phillips\n')
fprintf('%c',d_bullets)
fprintf('\n\n')

clear

%% Problem 50M

su_bullets = repmat('*', 25, 1); % setting up cmd line output
fprintf('\n')
fprintf('%c',su_bullets)
fprintf('\nProblem 50M\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

% Part A
fprintf('Part A\n------\n\n')
sys=tf(5000,[1,26,269,1524,4680]);
using_equation = stepinfo(sys,'RiseTimeLimits',[0,1])

% Part B
fprintf('\nPart B\n------\n\n')
root1 = -3.0000 + 6.0000*j;
root2 = -3.0000 - 6.0000*j;
po = poly([root1 root2]);
sys=tf(5000,po); % 5000 comes from unit step
using_dom_root = stepinfo(sys,'RiseTimeLimits',[0,1])

% comparison
fprintf('\nIt can be seen that using the dominant roots provides a decently reasonable\nestimate of the qualities derived: Percent Overshoot, Peak Time, and 100%% Rise Time.\n')
fprintf('\nUsing the given equation, the overshoot of %.2f%% was smaller than the dominant root estimation of %.2f%%.\n'...
        , using_equation.Overshoot, using_dom_root.Overshoot)
fprintf('\nUsing the given equation, the peak time of %.2f seconds was larger than the dominant root estimation of %.2f seconds.\n'...
        , using_equation.PeakTime, using_dom_root.PeakTime)
fprintf('\nUsing the given equation, the 100%% rise time of %.2f seconds which was larger than the dominant root estimation of %.2f seconds.\n\n'...
        , using_equation.SettlingTime, using_dom_root.SettlingTime)

%% Problem 52S

su_bullets = repmat('*', 25, 1); % setting up cmd line output
fprintf('\n')
fprintf('%c',su_bullets)
fprintf('\nProblem 52S\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

poly_block_52M = [-27/800, 27/80, 0,0]
LTI_52M = tf(1,[0.125, 0.75, 1])

sim('Problem_52S.slx')

plot(simout.time, simout.data)
legend('x(t)','y(t)','location', 'northeast','FontSize',16,'interpreter','latex')
ylabel('Function')
xlabel('Time')
title({'MAE 488, Homework 7, Problem 8.52S'},'interpreter','latex','FontSize',16)

%% Problem 54S

su_bullets = repmat('*', 25, 1); % setting up cmd line output
fprintf('\n')
fprintf('%c',su_bullets)
fprintf('\nProblem 54S\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

% For k = 4
k=4;
LTI_54M = tf(1,[5,3,7,k])
sim('Problem_54S.slx')

plot(simout.time, simout.data)
legend('x(t)','location', 'northeast','FontSize',16,'interpreter','latex')
ylabel('Function')
xlabel('Time')
title({'MAE 488, Homework 7, Problem 8.54S'},'interpreter','latex','FontSize',16)

% Experimenting with k
figure
n=5
for k = 1:n
    subplot(n,1,k);
    LTI_54M = tf(1,[5,3,7,k])
    sim('Problem_54S.slx')
    plot(simout.time, simout.data)
    hold on
end
% legend('x(t)','location', 'northeast','FontSize',16,'interpreter','latex')
% ylabel('Function')
% xlabel('Time')
% title({'MAE 488, Homework 7, Problem 8.54S'},'interpreter','latex','FontSize',16)
