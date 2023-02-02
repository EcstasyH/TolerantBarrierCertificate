function [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex3d_Lyapunov(vars, ra)

dim = 3;

x1 = vars(1);
x2 = vars(2);
x3 = vars(3);
x4 = vars(4);
x5 = vars(5);
x6 = vars(6);
d  = vars(7);

t=0.1;
f1 = x1+t*(-x2*2*d);
f2 = x2+t*(-x3*2*d);
f3 = x3+t*(-x1-2*x2-x3+x1^3);
f4 = 0;
f5 = 0;
f6 = 0;

if ra == 0
    % gamma1 = 2.0 (deg 8) 1.6 (deg 9, but long time)
    % gamma2 = 10.32 (deg 8)
    S0 = @(x1,x2,x3,x4,x5,x6) (x1-0.25)^2+(x2-0.25)^2+(x3-0.25)^2-0.2^2;
    Su = @(x1,x2,x3,x4,x5,x6) (x1-0.5)^2+(x2-0.5)^2+(x3-0.5)^2-0.2^2;
    St = @(x1,x2,x3,x4,x5,x6) -1;
    Sd = @(x1,x2,x3,x4,x5,x6) x1^2+x2^2+x3^2-2^2;
elseif ra == 1
    S0 = @(x1,x2,x3,x4,x5,x6) -1;
    Su = @(x1,x2,x3,x4,x5,x6) -1;
    St = @(x1,x2,x3,x4,x5,x6) -1;
    Sd = @(x1,x2,x3,x4,x5,x6) 1;
end
            