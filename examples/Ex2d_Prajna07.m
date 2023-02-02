function [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex2d_Prajna07(vars,ra)

% adapted from Prajna07TAC
% continuous time => descretization
dim = 2;

x1 = vars(1);
x2 = vars(2);
x3 = vars(3);
x4 = vars(4);
x5 = vars(5);
x6 = vars(6);
d  = vars(7);

t = 0.1;

f1 = x1+(x2+0.2*d*x1)*t;
f2 = x2+(-x1+1/3*x1^3-x2)*t;
f3 = 0;
f4 = 0;
f5 = 0;
f6 = 0;

S0 = @(x1,x2,x3,x4,x5,x6) (x1+1)^2+(x2+0.8)^2-0.2^2;
Su = @(x1,x2,x3,x4,x5,x6) (x1+1)^2+(x2+1)^2-0.8^2;
St = @(x1,x2,x3,x4,x5,x6) (x1+0)^2+(x2+0)^2-0.1^2;
Sd = @(x1,x2,x3,x4,x5,x6) (x1+0)^2+(x2+0)^2-2^2;
