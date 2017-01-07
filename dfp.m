function [s_dfp] = dfp()

% define the problem
[f_obj, n, x, x_init, epsilon] = define_problem();

k = 1; % design point number.  k= 0 is initialdesign point.

A(:,:,k) = eye(n);

syms a;

dp(:,k) = x_init;
 
% calculate initial gradient and its norm.
c(:,k) = central_diff(f_obj, x, dp ); 
norm_of_grad = norm(c(:,k));

% enter into a loop if initial design does not satisfy the condition of
% length of the gradient being smaller than epsilon.
while norm_of_grad > epsilon % && k < 3
    % condition was true, we need a new design point.

    d(:,k) = -A(:,:,k)*c(:,k);
    
    ak(:, k) = dp(:,k) + a*d(:,k);

    f_alpha = matlabFunction(subs(f_obj, x, ak(:, k)));
    
    a_k(k) = gss(f_alpha);
    
    s(:,k) = a_k(k)*d(:, k);
    
    dp(:, k+1) = dp(:, k) + s(:,k);
    c(:,k+1) = central_diff(f_obj, x, dp(:, k+1) ); 
    norm_of_grad = norm(c(:,k+1));
    
    y(:,k) = c(:,k+1) - c(:,k);
    z(:,k) = A(:,:,k)*y(:,k);
    
    
    B(:,:,k) = (s(:,k)*s(:,k)')./ dot(s(:,k),y(:,k));
    C(:,:,k) = -(z(:,k)*z(:,k)')./ dot(y(:,k),z(:,k));
    
    A(:,:,k+1) = A(:,:,k) + B(:,:,k) + C(:,:,k);
    
    k = k+1;
    
    f_k_dfp(:, k)  = double ( subs(f_obj, x, dp(:, k)));
end

save('f_dfp.mat','f_k_dfp')

s_method = sprintf('DFP Method');

s_dfp = summary(char(f_obj),s_method, x_init, dp(:, k), f_k_dfp(:, k), k-1);


end