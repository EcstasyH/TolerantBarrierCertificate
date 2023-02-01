function [f, S0, Su, Sd, dmin, dmax] = Ex_BC2D_RLCcircuit(vars,d)

% adapted from Zamani2022HSCC

x = vars(1);

bias = -0.2;
f = [x + 0.4*(d+bias)];

% init
xc = 0.25;
r = 0.25;

S0 = (x-xc)^2-r^2; %<= 0
% unsafe
Su = 0.5-x;%(x-2)^2-2^2;%  <=0
% domain
Sd = x^2-2^2; %<=0
% disturbance range
dmin = -1;
dmax = 1;