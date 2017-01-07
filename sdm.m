function [s_steep] = sdm()

% define the problem
[f_obj, n, x, x_init, epsilon] = define_problem();

k = 1; % design point number.  k= 0 is initialdesign point.

syms a;

dp(:,k) = x_init;

% calculate initial gradient and its norm.
c(:,k) = central_diff(f_obj, x, dp(:,k) ); 
norm_of_grad = norm(c(:,k));

% enter into a loop if initial design does not satisfy the condition of
% length of the gradient being smaller than epsilon.
while norm_of_grad > epsilon % && k < 3
    % condition was true, we need a new design point.
    

    d(:,k) = -c(:,k);
    
    ak(:,k) = dp(:,k) + a*d(:,k);

    f_alpha= matlabFunction(subs(f_obj, x, ak(:,k)));
    
    a_k(:,k) = gss(f_alpha);
    
    dp(:,k+1) = dp(:,k) + a_k(:,k)*d(:,k);
    
    
    k = k + 1;
    c(:,k) = central_diff(f_obj, x, dp(:,k) ); 
    norm_of_grad = norm(c(:,k));
    
    f_k_sd(:,k)  = double ( subs(f_obj, x, dp(:,k)));
end

save('f_sd.mat','f_k_sd')

s_method = sprintf('Steepest Descent Method');

s_steep = summary(char(f_obj),s_method, x_init, dp(:, k), f_k_sd(:,k), k-1);


end