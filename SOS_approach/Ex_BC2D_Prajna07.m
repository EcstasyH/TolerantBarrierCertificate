function [f, S0, Su, Sd, dmin, dmax] = Ex_BC2D_Prajna07(vars,d)

% adapted from Prajna07TAC
% continuous time => descretization

x = vars(1);
y = vars(2);

t = 0.1;
f = [x+(y+0.2*d*x)*t, y+ (-x+1/3*x^3-y)*t];

r = 0.2;
xc = -1;
yc = -0.8;
S0 = (x-xc)^2+(y-yc)^2-r^2; %<= 0
% unsafe
Su = (x+1)^2+(y+1)^2-0.8^2;%  <=0
% domain
Sd = x^2+y^2-2^2; %<=0

% disturbance range
dmin = -1;
dmax = 1;
        
%{
% simulation
r = 0.2;
xc = -1;
yc = -0.8;
t = 0.1;

f1 = @(x,y) x+(y+0.2*random('unif',-1,1)*x)*t;
f2 = @(x,y) y+ (-x+1/3*x^3-y)*t;

S0 = @(x,y) (x-xc)^2+(y-yc)^2-r^2;
Su = @(x,y) (x+1)^2+(y+1)^2-0.8^2; % <=0
Sd = @(x,y) x^2+y^2-2^2; %<=0
%}