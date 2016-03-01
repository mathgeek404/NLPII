% Homework 4
% Problem 4
answer = [-1, -1]'

%Variables
x = sym('x',[1,1])

%Initial choices
x_initial = [0,0]'
l_initial = [0]

f = x(1,1) + x(2,1)
c1 = x(1,1)^2+x(2,1)^2+2

% µk = 1, 10, 100, 1000
%Given u0 > 0, a nonnegative sequence {tk } with tk → 0, and a starting point xs
%for k  0, 1, 2,...
%Find an approximate minimizer xk of Q(·;uk ), starting at xs and terminating when ;
%if final convergence test satisfied
%stop with approximate solution xk ;
%end (if)
%Choose new penalty parameter uk+1 > uk ;
%Choose new starting point xs, k+1;
%end (for)

xk = x_initial;
lk = l_initial;

tolerance = 1/1
array_mu = [1, 10, 100, 1000]
for idx = 1:numel(array_mu)
    mu_k = array_mu(idx)
    tolerance = 1/mu_k
    L = f -lk'*c1+ (mu_k/2)*(c1)^2
    grad_L = gradient(L,x)
    grad_Lk = double(subs(grad_L,x,xk));
    hess_L = hessian(L,x)
    while norm(grad_Lk) > tolerance
		grad_Lk = double(subs(grad_L,x,xk));
		hess_Lk = double(subs(hess_L,x,xk));
		sol = -inv(hess_Q)*-grad_Q; %SOlve linear eqn
		xk = xk + sol;
	end
    lk = lk - mu_k*double(subs(c,x,xk))
end
