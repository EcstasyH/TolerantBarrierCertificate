function [f, S0, Su, Sd, dmin, dmax] = Ex_BC4D_Sanka13(vars,d)

% adapted from Sanka13IFAC
% TODO

x1 = vars(1);
x2 = vars(2);
x3 = vars(3);
x4 = vars(4);

f = [   -x1+x2^3-2*x3*x4,
        -x1-x2^3,
        x1*x4-x3,
        x1*x3-x4^3];

% init
S0 = x1^2+x2^2+x3^2+x4^2-0.3^2.; %<= 0
% unsafe <=0
Su = (x1+0.75)^2+(x2+0.75)^2+(x3+0.75)^2+(x4+0.75)^2-1^2;  
% domain <=0
Sd = x1^2+x2^2+x3^2+x4^2-4^2; 

% disturbance range
dmin = -1;
dmax = 1;
    