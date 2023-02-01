function [f, S0, Su, St, Sd, dmin, dmax] = Ex_RA_LieDeriv(vars,d)


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
Su = (x-0.5)^2+(y-0.75)^2-0.1^2;
% domain
Sd = x^2+y^2-1.5^2; %<=0

St = (x+1)^2 +(y-1)^2 -0.4^2;

% disturbance range
dmin = -1;
dmax = 1;