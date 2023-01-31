function [f, S0, Su, St, Sd, dmin, dmax] = Ex_RA_1(vars,d)


x = vars(1);
y = vars(2);

f = [0.5*x-x*y, x*y-0.5*y+d*y];

% init
S0 = x^2+y^2-0.9^2; %<=0
% unsafe
Su = 1-x^2-y^2;
% target
St = 100*x^2+100*y^2-1;
% domain
Sd = x^2+y^2-4^2; %<=0
% disturbance range
dmin = -0.5;
dmax = 0.5;
