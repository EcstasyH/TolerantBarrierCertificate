function [f, S0, Su, Sd, dmin, dmax] = Ex_BC2D_Zamani21(vars,d)

% adapted from Zamani2021CDC, Zamani2022HSCC

% real gamma ~ 6.6 largest visiting time~ 13
% gamma1 = 35
% gamma2 = NaN 

x = vars(1);
y = vars(2);

f = [8/9*x-1/18*y+0.01*d, y+x];
r = 0.25;
xc = 0.35;
yc = 1.5;

% init
S0 = (x-xc)^2+(y-yc)^2-r^2; %<= 0
% unsafe
Su = 2-y;
% domain
Sd = 9*x^2+y^2-3^2; %<=0
% disturbance range
dmin = -1;
dmax = 1;

%{  
%simulation
r = 0.25;
xc = 0.35;
yc = 1.5;

f1 = @(x,y) 8/9*x-1/18*y+0.01*random('unif',-1,1);
f2 = @(x,y) x+y;
S0 = @(x,y) (x-xc)^2+(y-yc)^2-r^2;
Su = @(x,y) 2-y; % <=0
Sd = @(x,y) 9*x^2+y^2-3^2; %<=0
%}
