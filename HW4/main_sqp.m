% Homework 4
% Problem 4

x = sym('x',[5,1])
l = sym('l',[5,1])

obj = exp(x[1,1]*x[2,1]*x[3,1]*x[4,1]*x[5,1])-(1/2)*(x[1,1]^3+x[2,1]^2+1)^2
c1 = x'*x-10
c2 = x[2,1]*x[3,1]-5*x[4,1]*x[5,1]
c3 = x[1,1]^3+x[2,1]^3+1

