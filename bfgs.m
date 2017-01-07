function [s_bfgs] = bfgs()

% define the problem
[f_obj, n, x, x_init, epsilon] = define_problem();

k = 1; % design point number.  k= 0 is initialdesign point.

H(:,:,k) = eye(n);

syms a;

dp(:,k) = x_init;
 
% calculate initial gradient and its norm.
c(:,k) = central_diff(f_obj, x, dp ); 
norm_of_grad = norm(c(:,k));

% enter into a loop if initial design does not satisfy the condition of
% length of the gradient being smaller than epsilon.
while norm_of_grad > epsilon % && k < 3
    % condition was true, we need a new design point.

    d(:,k) = linsolve(H(:,:,k), -c(:,k));
    
    ak(:, k) = dp(:,k) + a*d(:,k);

    f_alpha = matlabFunction(subs(f_obj, x, ak(:, k)));
    
    a_k(k) = gss(f_alpha);
    
    s(:,k) = a_k(k)*d(:, k);
    
    dp(:, k+1) = dp(:, k) + s(:,k);
    c(:,k+1) = central_diff(f_obj, x, dp(:, k+1) ); 
    norm_of_grad = norm(c(:,k+1));
    
    y(:,k) = c(:,k+1) - c(:,k);
    
    D(:,:,k) = (y(:,k)*y(:,k)')./ dot(y(:,k),s(:,k));
    E(:,:,k) = (c(:,k)*c(:,k)')./ dot(c(:,k),d(:,k));
    
    H(:,:,k+1) = H(:,:,k) + D(:,:,k) + E(:,:,k);
    
    k = k+1;
    
    f_k_bfgs(:, k)  = double ( subs(f_obj, x, dp(:, k)));
end

save('f_bfgs.mat','f_k_bfgs');

s_method = sprintf('BFGS Method');

s_bfgs = summary(char(f_obj),s_method, x_init, dp(:, k), f_k_bfgs(:, k), k-1);


end