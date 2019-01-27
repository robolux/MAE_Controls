% Hunter Phillips
% MAE488 - Homework 2
% Spring 2019
% Main
clear
clc
format compact; format short

%% Header
d_bullets = repmat('*', 51, 1); % concise way to make a lot of chars
fprintf('%c',d_bullets)
fprintf('\nMAE 488, Homework #2, Spring 2019, Hunter Phillips\n')
fprintf('%c',d_bullets)
fprintf('\n\n')

%% Problem 5
d_bullets = repmat('-', 51, 1);
fprintf('%c',d_bullets)
fprintf('\nProblem 5 - Partial Fraction Expansion Verification\n')
fprintf('%c',d_bullets)
fprintf('\n\n')

% part a
fprintf('Part A: F(s) = 25/(s(s+4)^2)\n')
top_a = 25;
bot_a = [1 8 16 0];
[r_a,p_a,k_a] = residue(top_a,bot_a);
fprintf('Coefficient Values: %.4f, %.4f, %.4f\n', r_a(1), r_a(2), r_a(3))
fprintf('Root Values: %d, %d, %d\n\n', p_a(1), p_a(2), p_a(3))

% part b
fprintf('Part B: F(s) = 21/(s^2(s+3))\n')
top_b = 21;
bot_b = [1 3 0 0];
[r_b,p_b,k_b] = residue(top_b,bot_b);
fprintf('Coefficient Values: %.4f, %.4f, %.4f\n', r_b(1), r_b(2), r_b(3))
fprintf('Root Values: %d, %d, %d\n\n', p_b(1), p_b(2), p_b(3))

% part c
fprintf('Part C: F(s) = (2s+2)/(s^2+6s+13)\n')
top_c = [2 2];
bot_c = [1 6 13];
[r_c,p_c,k_c] = residue(top_c,bot_c);
fprintf('Coefficient Values: %.4f%+.4fj, %.4f%+.4fj\n', real(r_c(1)), imag(r_c(1)), real(r_c(2)), imag(r_c(2)))
fprintf('Root Values: %.4f%+.4fj, %.4f%+.4fj\n\n', real(p_c(1)), imag(p_c(1)), real(p_c(2)), imag(p_c(2)))

% part d
fprintf('Part D: F(s) = (20s+16)/(s^3+6s^2+8^s)\n')
top_d = [20 16];
bot_d = [1 6 8 0];
[r_d,p_d,k_d] = residue(top_d,bot_d);
fprintf('Coefficient Values: %.4f, %.4f, %.4f\n', r_d(1), r_d(2), r_d(3))
fprintf('Root Values: %d, %d, %d\n\n', p_d(1), p_d(2), p_d(3))
