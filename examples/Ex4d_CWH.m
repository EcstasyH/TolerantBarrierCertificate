function [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex4d_CWH(vars,ra)


dim = 4;
t = 0.1;

x1 = vars(1);
x2 = vars(2);
x3 = vars(3);
x4 = vars(4);
x5 = vars(5);
x6 = vars(6);
d  = vars(7);

f1 = x1 + t*x2;
f2 = x2 + t*(3*x1 + 2*x4 + d/150);
f3 = x3 + t*(x4);
f4 = x4 + t*(-2*x2 + d/150);
f5 = 0;
f6 = 0;

if ra == 0
    S0 = @(x1,x2,x3,x4,x5,x6) (x1-0.35)^2+(x2-1.5)^2-0.25^2;
    Su = @(x1,x2,x3,x4,x5,x6) 4-x2^2;
    St = @(x1,x2,x3,x4,x5,x6) (x1+0)^2+(x2+0)^2-0.1^2;
    Sd = @(x1,x2,x3,x4,x5,x6) 9*(x1+0)^2+(x2+0)^2-3^2;
elseif ra == 1
    S0 = @(x1,x2,x3,x4,x5,x6) (x1+0.5)^2+(x2-0.5)^2+x3^2+x4^2-0.3^2;
    St = @(x1,x2,x3,x4,x5,x6) (x1+0.5)^2+x2^2+x3^2-0.3^2;
    Su = @(x1,x2,x3,x4,x5,x6) (x1+1)^2+(x2+1)^2+x3^2+x4^2-1;
    Sd = @(x1,x2,x3,x4,x5,x6) x1^2+x2^2+x3^2+x4^2-1;
end
        