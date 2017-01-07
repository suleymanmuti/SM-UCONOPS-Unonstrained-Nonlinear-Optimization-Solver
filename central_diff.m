function [c_cd] = central_diff(f, x, dp)
x_del = 1e-5;

n = length(x);

for i_iter = 1:n
   dp_cd_f = dp;
   dp_cd_f(i_iter) = dp(i_iter) + x_del;
   dp_cd_b = dp;
   dp_cd_b(i_iter)= dp(i_iter) - x_del;
   c_cd(i_iter) = ( subs(f, x, dp_cd_f) - subs(f, x, dp_cd_b) ) / (2*x_del);
end

c_cd = double(c_cd);

end