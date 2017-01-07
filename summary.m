function [s_string] = summary(f_obj, s_method, x_init, dp, f_k, k)

s_header = sprintf('\n%s\n%s\n%s\n', '-------', 'SUMMARY', '-------');

s_f_obj = sprintf('Objective function:\nf = %s;\n', f_obj);
s_iter = sprintf('\nNumber of iterations:\n%d', k);

init_String = sprintf('%f; ' , x_init);
init_String = init_String(1:end-2);
init_String = sprintf('Initial design point:\nx(0) = (%s)',init_String);

s_method = sprintf('\nSolution Method:\n%s', s_method);


r_header = sprintf('\n\n%s\n%s\n%s\n', '-------', 'RESULTS', '-------');

dp_String = sprintf('%f; ' , dp);
dp_String = dp_String(1:end-2);
dp_String = sprintf('Optimum design:\nx* = (%s)',dp_String);

f_Strimg = sprintf('f(x*) = %f', f_k);

s_string = sprintf('%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n', s_header, s_f_obj, init_String, s_method, r_header, dp_String, f_Strimg, s_iter);

% Store the summary and results of the problem in a text file.
fileID = fopen('summary_and_results.txt','wt');
fprintf(fileID,'*** SM-UCONOPS: Unonstrained Nonlinear Optimization Solver by Suleyman Muti ***\n\n\n');
fprintf(fileID, s_string);
fclose(fileID);
end