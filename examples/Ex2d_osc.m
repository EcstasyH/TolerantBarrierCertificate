function  [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex2d_osc(vars,ra)
    
% continuous time => descretization
    
dim = 2;

x1 = vars(1);
x2 = vars(2);
x3 = vars(3);
x4 = vars(4);
x5 = vars(5);
x6 = vars(6);
d  = vars(7);

t=0.1;
f1 = x1+t*x2;
f2 = x2+t*(-x1-2*(0.8-d)*x2);
f3 = 0;
f4 = 0;
f5 = 0;
f6 = 0;

if ra == 0
    S0 = @(x1,x2,x3,x4,x5,x6) (x1)^2+(x2-0.75)^2-0.1^2;
    Su = @(x1,x2,x3,x4,x5,x6) (x1-0.5)^2+(x2)^2-0.225^2;
    St = @(x1,x2,x3,x4,x5,x6) -1;
    Sd = @(x1,x2,x3,x4,x5,x6) (x1+0)^2+(x2+0)^2-1^2;
else
    S0 = @(x1,x2,x3,x4,x5,x6) (x1+2)^2+(x2+0)^2-0.5^2;
    Su = @(x1,x2,x3,x4,x5,x6) (x1-0)^2+(x2-1)^2-0.3^2;
    St = @(x1,x2,x3,x4,x5,x6) 10*(x1-0)^2+10*(x2-0)^2-1;
    Sd = @(x1,x2,x3,x4,x5,x6) (x1-0)^2+(x2-0)^2-10;
end
    
%{
================Safety==================
===============gamma1=================

Tring deg 2... No solution is found.
Elapsed time is 0.738865 seconds.

Tring deg 3... No solution is found.
Elapsed time is 1.297630 seconds.

Tring deg 4... No solution is found.
Elapsed time is 2.000506 seconds.

Tring deg 5... A feasible solution is found:
gamma1: 35.517423
Elapsed time is 2.762404 seconds.

Tring deg 6... A feasible solution is found:
gamma1: 31.649912
Elapsed time is 3.632869 seconds.

Tring deg 7... A feasible solution is found:
gamma1: 30.607255
Elapsed time is 4.627570 seconds.

Tring deg 8... A feasible solution is found:
gamma1: 29.924753
Elapsed time is 5.981747 seconds.

Tring deg 9... A feasible solution is found:
gamma1: 29.696438
Elapsed time is 7.388329 seconds.

Tring deg 10... A feasible solution is found:
gamma1: 29.613500
Elapsed time is 9.178738 seconds.

Tring deg 11... A feasible solution is found:
gamma1: 29.531212
Elapsed time is 11.239860 seconds.

Tring deg 12... A feasible solution is found:
gamma1: 29.468073
Elapsed time is 13.659774 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...No solution is found.
Elapsed time is 0.520185 seconds.

Tring deg 3 ...No solution is found.
Elapsed time is 1.119693 seconds.

Tring deg 4 ...No solution is found.
Elapsed time is 1.796589 seconds.

Tring deg 5 ...No solution is found.
Elapsed time is 2.564128 seconds.

Tring deg 6 ...No solution is found.
Elapsed time is 3.520021 seconds.

Tring deg 7 ...No solution is found.
Elapsed time is 4.602156 seconds.

Tring deg 8 ...No solution is found.
Elapsed time is 5.821934 seconds.

Tring deg 9 ...No solution is found.
Elapsed time is 7.277904 seconds.

Tring deg 10 ...No solution is found.
Elapsed time is 9.034337 seconds.

Tring deg 11 ...No solution is found.
Elapsed time is 11.209945 seconds.

Tring deg 12 ...No solution is found.
Elapsed time is 13.761918 seconds.
=====================================%}
