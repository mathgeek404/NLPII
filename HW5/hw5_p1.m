% Homework 4
% Problem 4
answer = [-1.71, 1.59, 1.82, -0.763, -0.763]'

%Variables
x = sym('x',[5,1])
l = sym('l',[3,1]) %num constraints

%Initial choices
x_initial = [-1.8, 1.7, 1.9, -0.8, -0.8]'
l_initial = [1,-1,1]'

f = x(1,1) + x(2,1)
c1 = x(1,1)^2+x(2,1)^2+2

% µk = 1, 10, 100, 1000 


%Given µ0 > 0, a nonnegative sequence {τk } with τk → 0, and a starting point xs
%for k  0, 1, 2,...
%Find an approximate minimizer xk of Q(·;µk ), starting at xs and terminating when ;
%if final convergence test satisfied
%stop with approximate solution xk ;
%end (if)
%Choose new penalty parameter µk+1 > µk ;
%Choose new starting point xs, k+1;
%end (for)

xk = x_initial;
lk = l_initial;

tolerance = 1/1
array_mu = [1, 10, 100, 1000]
for idx = 1:numel(array_mu)
    mu_k = array_mu(idx)
    tolerance = 1/mu_k
    Q = f -lk'*c+ (mu_k/2)*(c)^2
    
    while norm(grad_L) > tolerance
		hess_Q = double(subs(gradient(Q,x),x,xk));
		grad_Q = double(subs(hessian(Q,x),x,xk));
		sol = -inv(hess_Q)*-grad_Q; %SOlve linear eqn
		xk = xk + sol;
	end
end
    
    lk = lk - mu_k*double(subs(c,x,xk))
    
end
