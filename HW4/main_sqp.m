% Homework 4
% Problem 4

x = sym('x',[5,1])
l = sym('l',[3,1]) %num constraints

x_initial = [-1.71, 1.59, 1.82, -0.763, -0.763]'
l_initial = [-1.71, 1.59, 1.82, -0.763, -0.763]'


obj = exp(x(1,1)*x(2,1)*x(3,1)*x(4,1)*x(5,1))-(1/2)*(x(1,1)^3+x(2,1)^2+1)^2
c1 = x'*x-10
c2 = x(2,1)*x(3,1)-5*x(4,1)*x(5,1)
c3 = x(1,1)^3+x(2,1)^3+1

local_sqp(obj,[c1,c2,c3],x,l,x_initial, l_initial)
