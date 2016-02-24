% Homework 4
% Problem 4
answer = [-1.71, 1.59, 1.82, -0.763, -0.763]'

%Variables
x = sym('x',[5,1])
l = sym('l',[3,1]) %num constraints

%Initial choices
x_initial = [-1.8, 1.7, 1.9, -0.8, -0.8]'
l_initial = [1,-1,1]'

f = exp(x(1,1)*x(2,1)*x(3,1)*x(4,1)*x(5,1))-(0.5)*(x(1,1)^3+x(2,1)^3+1)^2
c1 = x(1,1)^2+x(2,1)^2+x(3,1)^2+x(4,1)^2+x(5,1)^2-10
c2 = x(2,1)*x(3,1)-5*x(4,1)*x(5,1)
c3 = x(1,1)^3+x(2,1)^3+1
c = [c1;c2;c3]

%Algo 18.1
%Find symbolic components
grad_f = gradient(f)
A = jacobian(c,x)
F = [gradient(f,x)-A'*l; c];
Fj = jacobian(F,[x;l])

%Setup
xk = x_initial;
lk = l_initial;
old_sol= [1;2;3;4;5;6;7;8]
sol = [8;7;6;5;4;3;2;1]

%No convergence test specified, chose a simple norm heuristic
while norm(sol-old_sol) > 1*10^-8
  old_sol = sol  

  Fk = double(subs(Fj,[x;l],[xk;lk]));
  grad_fk = double(subs(grad_f,x,xk));
  ck = double(subs(c,x,xk));
  sol = inv(Fk)*-[grad_fk; ck] %SOlve linear eqn
  xk = xk + sol(1:5,1);
  lk = sol(6:8,1);
  i=i+1;
end

xk
