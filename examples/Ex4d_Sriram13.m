function [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex4d_Sriram13(vars,ra)

% adapted from Sriram13
% only safety

dim = 4;

x1 = vars(1);
x2 = vars(2);
x3 = vars(3);
x4 = vars(4);
x5 = vars(5);
x6 = vars(6);
d  = vars(7);

t = 0.1;

f1 = x1 + (-x1*d+x2^3-2*x3*x4)*t;
f2 = x2 + (-x1*d-x2^3)*t;
f3 = x3 + (x1*x4-x3*d)*t;
f4 = x4 + (x1*x3-x4^3)*t;
f5 = 0;
f6 = 0;

S0 = @(x1,x2,x3,x4,x5,x6) (x1-0.5)^2+(x2-0.5)^2+(x3-0)^2+(x4-0)^2-0.1^2; 
Su = @(x1,x2,x3,x4,x5,x6) (x1-0.25)^2+(x2-0.25)^2+(x3-0)^2+(x4-0)^2-0.1^2;
St = @(x1,x2,x3,x4,x5,x6) -1;
Sd = @(x1,x2,x3,x4,x5,x6) x1^2+x2^2+x3^2+x4^2-1^2;
            