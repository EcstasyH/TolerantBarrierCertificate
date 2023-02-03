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

t = 0.1;

f1 = x1+t*x2;
f2 = x2-t*(x1+(1.5-0.5*d)*x2);
f3 = 0;
f4 = 0;
f5 = 0;
f6 = 0;

if ra == 0
    S0 = @(x1,x2,x3,x4,x5,x6) (x1+2)^2+(x2+0)^2-0.5^2;
    Su = @(x1,x2,x3,x4,x5,x6) (x1-0)^2+(x2-1)^2-0.3^2;
    St = @(x1,x2,x3,x4,x5,x6) 10*(x1-0)^2+10*(x2-0)^2-1;
    Sd = @(x1,x2,x3,x4,x5,x6) (x1-0)^2+(x2-0)^2-10;
%    S0 = @(x1,x2,x3,x4,x5,x6) (x1+2)^2+(x2+0)^2-0.5^2;
%    Su = @(x1,x2,x3,x4,x5,x6) 10*(x1-0)^2+10*(x2-1)^2-1;
%    St = @(x1,x2,x3,x4,x5,x6) 10*(x1-0)^2+10*(x2-0)^2-1;
%    Sd = @(x1,x2,x3,x4,x5,x6) (x1-0)^2+(x2-0)^2-10;
else
    S0 = @(x1,x2,x3,x4,x5,x6) (x1+2)^2+(x2+0)^2-0.5^2;
    Su = @(x1,x2,x3,x4,x5,x6) (x1-0)^2+(x2-1)^2-0.3^2;
    St = @(x1,x2,x3,x4,x5,x6) 10*(x1-0)^2+10*(x2-0)^2-1;
    Sd = @(x1,x2,x3,x4,x5,x6) (x1-0)^2+(x2-0)^2-10;
end
    
%{
================Safety==================
===============gamma1=================

Tring deg 2... A feasible solution is found:
gamma1: 19.975646
Elapsed time is 0.608726 seconds.

Tring deg 3... A feasible solution is found:
gamma1: 10.197422
Elapsed time is 1.218501 seconds.

Tring deg 4... No solution is found.
Elapsed time is 1.910322 seconds.

Tring deg 5... No solution is found.
Elapsed time is 2.668010 seconds.

Tring deg 6... No solution is found.
Elapsed time is 3.572657 seconds.

Tring deg 7... No solution is found.
Elapsed time is 4.656638 seconds.

Tring deg 8... A feasible solution is found:
gamma1: 0.002747
Warning: there may be numerical errors.
Elapsed time is 5.970413 seconds.

Tring deg 9... A feasible solution is found:
gamma1: 0.000566
Warning: there may be numerical errors.
Elapsed time is 7.473691 seconds.

Tring deg 10... A feasible solution is found:
gamma1: -0.000793
Warning: there may be numerical errors.
Elapsed time is 9.326827 seconds.

Tring deg 11... A feasible solution is found:
gamma1: -0.000086
Warning: there may be numerical errors.
Elapsed time is 11.382171 seconds.

Tring deg 12... No solution is found.
Elapsed time is 14.054343 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...A feasible solution is found:
gamma2: 78.211337
Elapsed time is 0.581832 seconds.

Tring deg 3 ...A feasible solution is found:
gamma2: 77.619878
Elapsed time is 1.163261 seconds.

Tring deg 4 ...No solution is found.
Elapsed time is 1.854327 seconds.

Tring deg 5 ...No solution is found.
Elapsed time is 2.611200 seconds.

Tring deg 6 ...No solution is found.
Elapsed time is 3.633707 seconds.

Tring deg 7 ...No solution is found.
Elapsed time is 4.679229 seconds.

Tring deg 8 ...No solution is found.
Elapsed time is 5.924884 seconds.

Tring deg 9 ...No solution is found.
Elapsed time is 7.363599 seconds.

Tring deg 10 ...No solution is found.
Elapsed time is 9.125236 seconds.

Tring deg 11 ...No solution is found.
Elapsed time is 11.275121 seconds.

Tring deg 12 ...A feasible solution is found:
gamma2: 6.755922
Elapsed time is 13.723492 seconds.
=====================================

==============Reach-Avoid=============
===============gamma1=================

Tring deg 2... A feasible solution is found:
gamma1: 19.969396
Elapsed time is 0.589392 seconds.

Tring deg 3... A feasible solution is found:
gamma1: 7.614305
Elapsed time is 1.223656 seconds.

Tring deg 4... No solution is found.
Elapsed time is 1.933005 seconds.

Tring deg 5... No solution is found.
Elapsed time is 2.708347 seconds.

Tring deg 6... A feasible solution is found:
gamma1: 0.035223
Warning: there may be numerical errors.
Elapsed time is 3.665072 seconds.

Tring deg 7... A feasible solution is found:
gamma1: 0.011428
Warning: there may be numerical errors.
Elapsed time is 4.754801 seconds.

Tring deg 8... A feasible solution is found:
gamma1: 0.000577
Warning: there may be numerical errors.
Elapsed time is 6.166411 seconds.

Tring deg 9... A feasible solution is found:
gamma1: 0.000792
Warning: there may be numerical errors.
Elapsed time is 7.654199 seconds.

Tring deg 10... No solution is found.
Elapsed time is 9.611014 seconds.

Tring deg 11... No solution is found.
Elapsed time is 11.742462 seconds.

Tring deg 12... No solution is found.
Elapsed time is 14.560359 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...No solution is found.
Elapsed time is 0.591178 seconds.

Tring deg 3 ...A feasible solution is found:
gamma2: 71.240500
Elapsed time is 1.190801 seconds.

Tring deg 4 ...No solution is found.
Elapsed time is 1.888576 seconds.

Tring deg 5 ...No solution is found.
Elapsed time is 2.691495 seconds.

Tring deg 6 ...No solution is found.
Elapsed time is 3.688316 seconds.

Tring deg 7 ...No solution is found.
Elapsed time is 4.727309 seconds.

Tring deg 8 ...No solution is found.
Elapsed time is 6.124618 seconds.

Tring deg 9 ...No solution is found.
Elapsed time is 7.602865 seconds.

Tring deg 10 ...No solution is found.
Elapsed time is 9.387809 seconds.

Tring deg 11 ...No solution is found.
Elapsed time is 11.545400 seconds.

Tring deg 12 ...A feasible solution is found:
gamma2: 6.731150
Elapsed time is 14.087091 seconds.
=====================================
%}
