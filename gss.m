function alpha_min = gss(f)
syms a;
phi = double( (sqrt(5)-1) / 2 ); % golden ratio
del = .05;% small increment value
accuracy = .0001; % function difference precision

max_iter  = 100; % maximum number of iterations for Phase I and II.

alpha(1) = 0; % first value  of alpha
alpha(2) = del; % second value of alpha is equal to the small increment value


% begin iterations for Phase I
i_iter = 1;
while i_iter <= max_iter
    
    if ( f(alpha(i_iter)) > f(alpha(i_iter + 1)) )
        alpha(i_iter + 2) = 0;

        for j_iter = 1 : i_iter+1
            alpha(i_iter + 2) = alpha(i_iter + 2) + del*(1.618)^(j_iter-1);
        end
    else
        break
    end
    
    i_iter = i_iter + 1; % increment number of iterations by 1
end

% the uncertainity interval 
alpha_l = 0; % set lower bound of alpha since it cannot be known how many alphas will be enough, i.e. alpha(i_iter - 2) may be null.
alpha_u = alpha(i_iter + 1);

% divide uncertainity interval using golden ratio, (i.e., set new interval
% boundaries)
a = alpha_l + (1 - phi)*(alpha_u - alpha_l);  
b = alpha_l + phi*(alpha_u - alpha_l);

% calculate function values at points
f_a = f(a);
f_b = f(b);

% begin iterations for Phase II
i_iter = 1;
while ( ( abs(alpha_u-alpha_l) > accuracy ) && (i_iter < max_iter) ) && (i_iter < max_iter)
    if(f_a < f_b)
        alpha_u = b;
        b = a;
        a = alpha_l + (1 - phi)*(alpha_u - alpha_l);
        
        f_a=f(a);
        f_b=f(b);
        
    else
        alpha_l = a;
        a = b;
        b = alpha_l + phi*(alpha_u - alpha_l);
        
        f_a = f(a);
        f_b = f(b);
    end
end

% print alpha value that minimizes the line search function
if(f_a<f_b)
    alpha_min = a;
else
    alpha_min = b;
end


