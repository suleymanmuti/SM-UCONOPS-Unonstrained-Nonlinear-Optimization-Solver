function [s_cg] = cgm()

% define the problem
[f_obj, n, x, x_init, epsilon] = define_problem();

k = 1; % design point number.  k= 0 is initialdesign point.

syms a;

dp(:,k) = x_init;

% calculate initial gradient and its norm.
c(:,k) = central_diff(f_obj, x, dp(:,k) ); 
norm_of_grad = norm(c(:,k));

d(:,k) = -c(:,k);

ak(:,k) = dp(:,k) + a*d(:,k);
f_alpha = matlabFunction(subs(f_obj, x, ak(:,k)));
    
a_k(:,k) = gss(f_alpha);

dp(:,k+1) = dp(:,k) + a_k(:,k)*d(:,k);

k = k + 1;

c(:,k) = central_diff(f_obj, x, dp(:,k) );
% enter into a loop if initial design does not satisfy the condition of
% length of the gradient being smaller than epsilon.
while norm_of_grad > epsilon % && k < 3
    % condition was true, we need a new design point.
    
    b(:,k) = dot(c(:,k), c(:,k)) ./ dot(c(:,k-1), c(:,k-1));

    d(:,k) = -c(:,k) + b(:,k)*d(:,k-1);
    
    ak(:,k) = dp(:,k) + a*d(:,k);
    
    f_alpha = matlabFunction(subs(f_obj, x, ak(:,k)));

    a_k(:,k) = gss(f_alpha);

    dp(:,k+1) = dp(:,k) + a_k(:,k)*d(:,k);

        
    k = k + 1;
    c(:,k) = central_diff(f_obj, x, dp(:,k) );
    norm_of_grad = norm(c(:,k));
    
    f_k_cg(:,k)  = double ( subs(f_obj, x, dp(:,k)));
end

save('f_cg.mat','f_k_cg')
s_method = sprintf('Conjugate Gradient Method');

s_cg = summary(char(f_obj),s_method, x_init, dp(:, k), f_k_cg(:,k), k-1);


end