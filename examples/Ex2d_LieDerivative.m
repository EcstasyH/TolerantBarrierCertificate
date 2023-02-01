function [f, S0, Su, Sd, dmin, dmax] = Ex_BC2D_LieDeriv(vars,d)
    
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
f1 = x1+(-2*x2)*t;
f2 = x2+x1^2*t+t*d*x1;
f3 = 0;
f4 = 0;
f5 = 0;
f6 = 0;

S0 = @(x1,x2,x3,x4,x5,x6) (x1-0)^2+(x2+0.5)^2-0.1^2;
Su = @(x1,x2,x3,x4,x5,x6) (x1-0.5)^2+(x2+0.75)^2-0.4^2;
%St = @(x1,x2,x3,x4,x5,x6) (x1+0)^2+(x2+0)^2-0.1^2;
Sd = @(x1,x2,x3,x4,x5,x6) (x1+0)^2+(x2+0)^2-1.5^2;



% 
r = 0.1;
xc = 0;
yc = -0.5;   
S0 = (x-xc)^2+(y-yc)^2-r^2; %<= 0
% unsafe
Su = (x-0.5)^2+(y-0.75)^2-0.4^2;
% domain
Sd = x^2+y^2-1.5^2; %<=0
