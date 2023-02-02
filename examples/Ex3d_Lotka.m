function [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex3d_Lotka(vars,ra)

dim = 3;

x1 = vars(1);
x2 = vars(2);
x3 = vars(3);
x4 = vars(4);
x5 = vars(5);
x6 = vars(6);
d  = vars(7);

t=0.1;
f1 = x1+t*(x1*(d-x3));
f2 = x2+t*(x2*(1-2*x3));
f3 = x3+t*(x3*(x1+x2-1));
f4 = 0;
f5 = 0;
f6 = 0;

if ra == 0
    %gamma1=9.7 (deg=10) 12.7 (deg 8)
    %gamma2=18.0 (deg=10) 20.1 (deg 8)
    S0 = @(x1,x2,x3,x4,x5,x6) (x1-1)^2+(x2-1)^2+(x3)^2-0.8^2;
    Su = @(x1,x2,x3,x4,x5,x6) (x1)^2+(x2+1)^2-0.2^2;
    St = @(x1,x2,x3,x4,x5,x6) -1;
    Sd = @(x1,x2,x3,x4,x5,x6) x1^2+x2^2+x3^2-2^2;
elseif ra == 1
    S0 = @(x1,x2,x3,x4,x5,x6) (x1-1)^2+(x2-1)^2+(x3-1)^2-0.3^2;
    Su = @(x1,x2,x3,x4,x5,x6) (x1)^2+(x2+1)^2-0.1^2;
    St = @(x1,x2,x3,x4,x5,x6) x1^2+x2^2+x3^2-0.3^2;
    Sd = @(x1,x2,x3,x4,x5,x6) (x1)^2+(x2)^2+x3^2-4;
end
            