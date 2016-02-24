% Homework 4
% Problem 4

x = sym('x',[5,1])
l = sym('l',[3,1]) %num constraints

x_initial = [-1.71, 1.59, 1.82, -0.763, -0.763]'
l_initial = [-1.71, 1.59, 1.82, -0.763, -0.763]'


f = exp(x(1,1)*x(2,1)*x(3,1)*x(4,1)*x(5,1))-(1/2)*(x(1,1)^3+x(2,1)^2+1)^2
c1 = x'*x-10
c2 = x(2,1)*x(3,1)-5*x(4,1)*x(5,1)
c3 = x(1,1)^3+x(2,1)^3+1
c = [c1;c2;c3]

%Algo 18.1
grad_f = gradient(f)
A = jacobian(c,x)

F = [gradient(f,x)-A'*l; c];
Fj = jacobian(F,[x;l])

xk = x_initial
lk = [0;0;0]

while 1==1
  Fk = subs(Fj,[x;l],[xk;lk])
  grad_fk = subs(grad_f,x,xk)
  ck = subs(c,x,xk)
  sol = inv(Fk)*-[Fk, ck]
  xk = xk + sol(1:5,1)
  lk = lk + sol(6:8,1)
end
