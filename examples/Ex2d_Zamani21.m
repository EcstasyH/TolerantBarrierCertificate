function [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex2d_Zamani21(vars,ra)

% adapted from Zamani21CDC

dim = 2;

x1 = vars(1);
x2 = vars(2);
x3 = vars(3);
x4 = vars(4);
x5 = vars(5);
x6 = vars(6);
d  = vars(7);

f1 = 8/9*x1-1/18*x2+0.01*d;
f2 = x1+x2;
f3 = 0;
f4 = 0;
f5 = 0;
f6 = 0;

if ra == 0
    S0 = @(x1,x2,x3,x4,x5,x6) (x1-0.35)^2+(x2-1.5)^2-0.25^2;
    Su = @(x1,x2,x3,x4,x5,x6) 4-x2^2;
    St = @(x1,x2,x3,x4,x5,x6) (x1+0)^2+(x2+0)^2-0.1^2;
    Sd = @(x1,x2,x3,x4,x5,x6) 9*(x1+0)^2+(x2+0)^2-3^2;
elseif ra == 1
    S0 = @(x1,x2,x3,x4,x5,x6) (x1-0.35)^2+(x2-1.5)^2-0.25^2;
    Su = @(x1,x2,x3,x4,x5,x6) 2^2-x2^2;
    St = @(x1,x2,x3,x4,x5,x6) 9*(x1+0)^2+(x2+0)^2-0.5^2;%0.2^2
    Sd = @(x1,x2,x3,x4,x5,x6) 9*(x1+0)^2+(x2+0)^2-3^2;
end
        