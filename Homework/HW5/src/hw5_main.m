% Hunter Phillips
% Problem 6.50M and 6.52M
% MAE 488
% 02/24/19

clc
format compact

%% Header
d_bullets = repmat('*', 50, 1); % concise way to make a lot of chars
fprintf('%c',d_bullets)
fprintf('\nMAE 488, Homework #5, Spring 2019, Hunter Phillips\n')
fprintf('%c',d_bullets)
fprintf('\n\n')

clear

%% Problem 6.50M

f1 = figure(1);

R = 1E+3; 
C = 2E-6; 
L = 2E-3; 

num = [R*C, 0];
den = [L*R*C, L, R];

sys1 = tf(1, den);
sys2 = tf(num, den);

t = [0:0.00001:0.025];

i3_1 = step(sys1, t);

v_2 = 4*sin(2*pi*60*t);
i3_2 = lsim(sys2, v_2, t);
i3 = 5*i3_1 + i3_2;

plot(t, i3)

title({'MAE 488, Homework 5, Problem 6.50M'})
xlabel('t (s)')
ylabel('i_3 (A)')

% print(f1,'problem_6_50M.png','-dpng','-r1200');

%% Problem 6.52M

f2 = figure(2);

KT = 0.05;
Kb = KT;
c = 0;
Ra = 0.8;
La = 3e-3;
I = 8e-5;

% trapezoid input
t1 = 0.5;
t2 = 2;
tfinal = 2.5;
t3 = 4;
max_v = 30;
dt = t3/1000;
t = [0:dt:t3];

for k = 1:1001
  if t(k) <= t1
     v(k) = (max_v/t1)*t(k);
  elseif t(k) <= t2
     v(k) = max_v;
  elseif t(k) <= tfinal
     v(k) = (max_v/t1)*(tfinal - t(k));
  else
     v(k) = 0;
  end
end

% motor transfer functions
currenttf = tf([I,c],[La*I,Ra*I+c*La,c*Ra+Kb*KT]);
speedtf = tf(KT,[La*I,Ra*I+c*La,c*Ra+Kb*KT]);

current = lsim(currenttf, v, t);
speed = lsim(speedtf, v, t);

subplot(2,1,1)
plot(t,current),xlabel('t (s)')
title({'MAE 488, Homework 5, Problem 6.52M'})
ylabel('Current (A)')
grid
ylim([-2.25 2.25])

subplot(2,1,2)
plot(t,speed,'r')
xlabel('t (s)')
ylabel('Speed (rad/s)') 
grid
ylim([-50 650])

% performance parameters

su_bullets = repmat('*', 40, 1); % setting up cmd line output
fprintf('\n\n')
fprintf('%c',su_bullets)
fprintf('\nProblem 6.52M Performance Parameters\n')
fprintf('%c',su_bullets)
fprintf('\n\n')

ia = current;
dt = t(2) - t(1);
E = trapz(t,Ra*ia.^2) + trapz(t,c*speed.^2);
i_max = max(ia);
i_rms = sqrt(trapz(t,ia.^2)/t3); 
T_max = KT*i_max;
T_rms = KT*i_rms;
max_speed = max(speed);
v_max = Ra*i_max+Kb*max_speed;

fprintf('Energy Consumption per Cycle = E         = %f J/cycle\n', E)
fprintf('Maximum Required Torque      = T_max     = %f N-m\n', T_max)
fprintf('Maximum Required Current     = I_max     = %f A\n', i_max)
fprintf('Maximum Required Voltage     = V_max     = %.5f V\n', v_max)
fprintf('Maximum Speed                = speed_max = %.4f rad/s\n', max_speed)
fprintf('RMS Torque                   = T_rms     = %f N-m\n', T_rms)
fprintf('RMS Current                  = i_rms     = %f A\n\n\n', i_rms)


% print(f2,'problem_6_52M.png','-dpng','-r1200');
