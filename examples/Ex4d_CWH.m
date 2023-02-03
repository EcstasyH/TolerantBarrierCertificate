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
        
%{
==============Reach-Avoid===============
===============gamma1=================

Tring deg 2... No solution is found.
Elapsed time is 2.270682 seconds.

Tring deg 3... No solution is found.
Elapsed time is 5.375500 seconds.

Tring deg 4... A feasible solution is found:
gamma1: 19.946352
Elapsed time is 16.202254 seconds.

Tring deg 5... A feasible solution is found:
gamma1: 15.926526
Elapsed time is 30.911247 seconds.

Tring deg 6... A feasible solution is found:
gamma1: 11.627453
Elapsed time is 99.035832 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...No solution is found.
Elapsed time is 2.155446 seconds.

Tring deg 3 ...No solution is found.
Elapsed time is 5.101976 seconds.

Tring deg 4 ...A feasible solution is found:
gamma2: 37.078265
Elapsed time is 14.763087 seconds.

Tring deg 5 ...A feasible solution is found:
gamma2: 25.760184
Elapsed time is 29.667695 seconds.

Tring deg 6 ...A feasible solution is found:
gamma2: 19.612834
Elapsed time is 96.624216 seconds.
=====================================
%}