% clear the workspace
clc; clear all; clc;

fprintf('*** Welcome to SM-UCONOPS: Unonstrained Nonlinear Optimization Solver by Suleyman Muti ***\n\n\n');

fprintf('>>> Use define_problem.m to define the unconstrained optimization problem.\n\n\n');

% define the problem
[f_obj, n, x, x_init, epsilon] = define_problem();
fprintf('Defined problem: \n\n');
fprintf('Objective function:\nf = %s;\n', char(f_obj));

init_String = sprintf('%f; ', x_init);
init_String = init_String(1:end-2);
fprintf('Initial desing point:\nx(0) = (%s)',init_String);


fprintf('\n\n\nPlease select a solution method.\n\n');
prompt = '[0] - Quit SM-UCONOPS\n\n[1] - Steepest Descent Method\n[2] - Conjugate Gradient Method\n[3] - DFP Method\n[4] - BFGS Method\n\n>> ';
x = input(prompt); 
while (x < 0) || (x > 4) || ~(rem(x,1) == 0)
    
    fprintf('Please enter a valid option\n\n');
    x = input(prompt);
end

% call the solution method based on user input.
switch x
    case 1
        dp = sdm(); % a)
    case 2
        dp = cgm(); % b)
    case 3
        dp = dfp(); % c)
    case 4
        dp =  bfgs(); % d)
    case 0
        dp =  sprintf('\nYou choosed to quit SM-UCONOPS.\n\n');
    otherwise
        fprintf('An error occured. Please restart!\n\n');
end

fprintf(dp);

% run the following line after solving a problem with all four methods.
% convergence_plot();