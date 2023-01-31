function [f, S0, Su, Sd, dmin, dmax] = Ex_BC2D_RLCcircuit(vars,d)

% adapted from Zamani2022HSCC

%TODO

f = [8/9*x-1/18*y+0.01*d, y+x];

r = 0.25;
xc = 0.5;
yc = 1.5;

% init
S0 = (x-xc)^2+(y-yc)^2-r^2; %<= 0
% unsafe
%Su = 2-y; 
Su = 4-y^2;%  <=0
% domain
Sd = x^2+y^2-4^2; %<=0
% disturbance range
dmin = -1;
dmax = 1;