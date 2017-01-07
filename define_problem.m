function [f, n, x, x_init, epsilon] = define_problem()

% Homework 4
n = 2; % Enter the number of variable in the objective function here.
x = sym('x',[n 1]); % variables of objective function
f = x(1).^2 + 2*x(2).^2 - 4*x(1) - 2*x(1)*x(2);  
x_init = [1; 1];
epsilon = 0.005;


% Example problems from the book.

% Example 10.4
% n = 2; % Enter the number of variable in the objective function here.
% x = sym('x',[n 1]); % variables of objective function
% f = x(1).^2 + x(2).^2 -2*x(1)*x(2);  
% x_init = [1; 0];
% epsilon = 0.005;

% Example 10.6
% n = 3; % Enter the number of variable in the objective function here.
% x = sym('x',[n 1]); % variables of objective function
% f = x(1).^2 + 2*x(2).^2 + 2*x(3).^2 + 2*x(1)*x(2) + 2*x(2)*x(3);
% x_init = [2; 4; 10];
% epsilon = 0.005;

% Exercise 10.52
% n = 2; % Enter the number of variable in the objective function here.
% x = sym('x',[n 1]); % variables of objective function
% f = x(1).^2 + 2*x(2).^2 - 4*x(1) - 2*x(1)*x(2);  
% x_init = [1; 1];
% epsilon = 0.005;

% Exercise 10.57
% n = 3; % Enter the number of variable in the objective function here.
% x = sym('x',[n 1]); % variables of objective function
% f = x(1).^2 + 2*x(2).^2 + 2*x(3).^2 + 2*x(1)*x(2) + 2*x(2)*x(3);
% x_init = [1; 1; 1];
% epsilon = 0.005;

% Exercise 10.59
% n = 2; % Enter the number of variable in the objective function here.
% x = sym('x',[n 1]); % variables of objective function
% f = 9*x(1).^2 + 9*x(2).^2 - 100*sqrt(x(1).^2 + x(2).^2 - 20*x(2) +100) - 64*sqrt(x(1).^2 + x(2).^2 + 16*x(2) + 64) - 5*x(1) - 41*x(2);
% x_init = [5; 2];
% epsilon = 0.005;

% Exercise 10.62
% n = 4; % Enter the number of variable in the objective function here.
% x = sym('x',[n 1]); % variables of objective function
% f = ( x(1) - 10*x(2) ).^2 + 5*( x(3) - x(4) ).^2 + ( x(2) - 2*x(3) ).^4 + 10*( x(1) - x(4) ).^4;
% x_init = [1; 2; 3; 4];
% epsilon = 0.005;

% Example 11.9 and 11.10s
% n = 2; % Enter the number of variable in the objective function here.
% x = sym('x',[n 1]); % variables of objective function
% f = 5*x(1).^2 + 2*x(1)*x(2) + x(2).^2 + 7;  
% x_init = [1; 2];
% epsilon = 0.001;

end