function [f, S0, Su, Sd, dmin, dmax] = Ex_BC2D_LieDeriv(vars,d)
    
% continuous time => descretization

% real gamma >5.0 largest 6
% gamma1 = 8.3
% gamma2 = 14.0

x = vars(1);
y = vars(2);


t = 0.1;
f = [x+(-2*y)*t,
     y+x^2*t+t*d*x];

% 
r = 0.1;
xc = 0;
yc = -0.5;   
S0 = (x-xc)^2+(y-yc)^2-r^2; %<= 0
% unsafe
Su = (x-0.5)^2+(y-0.75)^2-0.4^2;
% domain
Sd = x^2+y^2-1.5^2; %<=0

% disturbance range
dmin = -1;
dmax = 1;
    
% simulation
%{
r = 0.1;
xc = 0;
yc = -0.5;

t = 0.1;
f1 = @(x,y) x+(-2*y)*t;
f2 = @(x,y) y+x^2*t+t*random('unif',-1,1)*x;

S0 = @(x,y) (x-xc)^2+(y-yc)^2-r^2;
Su = @(x,y) (x-0.5)^2+(y-0.75)^2-0.4^2;
Sd = @(x,y) x^2+y^2-1.5^2;

%}
        