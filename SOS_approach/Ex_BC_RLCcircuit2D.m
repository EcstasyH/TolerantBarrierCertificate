function [f, S0, Su, Sd, dmin, dmax] = Ex_BC_RLCcircuit2D(x,y,d)
% from Zamani2021CDC

f = [8/9*x-1/18*y+0.01*d, y+x];

% init
S0 = (x-0.25)^2+(y-1)^2-0.25^2; %<= 0
% unsafe
Su = 2-y; % <=0
% domain
Sd = x^2+y^2-4^2; %<=0
% disturbance range
dmin = -1;
dmax = 1;