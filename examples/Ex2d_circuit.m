function [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex2d_circuit(vars,ra)

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

S0 = @(x1,x2,x3,x4,x5,x6) (x1-0.35)^2+(x2-1.5)^2-0.25^2;
Su = @(x1,x2,x3,x4,x5,x6) 2^2-x2^2;
St = @(x1,x2,x3,x4,x5,x6) 9*(x1+0)^2+(x2+0)^2-0.5^2;%0.2^2
Sd = @(x1,x2,x3,x4,x5,x6) 9*(x1+0)^2+(x2+0)^2-3^2;

%{
================Safety==================
===============gamma1=================
    S0 = @(x1,x2,x3,x4,x5,x6) (x1-0.2)^2+(x2-0.6)^2-0.1^2;
    Su = @(x1,x2,x3,x4,x5,x6) 1.2-x2;
    St = @(x1,x2,x3,x4,x5,x6) 9*(x1+0)^2+(x2+0)^2-0.5^2;%0.2^2
    Sd = @(x1,x2,x3,x4,x5,x6) 9*(x1+0)^2+(x2+0)^2-1.5^2;

Tring deg 2... No solution is found.
Elapsed time is 0.601327 seconds.

Tring deg 3... No solution is found.
Elapsed time is 1.180206 seconds.

Tring deg 4... No solution is found.
Elapsed time is 1.908734 seconds.

Tring deg 5... A feasible solution is found:
gamma1: 14.654034
Elapsed time is 2.839615 seconds.

Tring deg 6... No solution is found.
Elapsed time is 4.081283 seconds.

Tring deg 7... No solution is found.
Elapsed time is 5.660043 seconds.

Tring deg 8... No solution is found.
Elapsed time is 8.002045 seconds.

Tring deg 9... No solution is found.
Elapsed time is 11.490582 seconds.

Tring deg 10... A feasible solution is found:
gamma1: 0.001235
Warning: there may be numerical errors.
Elapsed time is 16.596317 seconds.

Tring deg 11... A feasible solution is found:
gamma1: 0.001753
Warning: there may be numerical errors.
Elapsed time is 23.853657 seconds.

Tring deg 12... A feasible solution is found:
gamma1: -0.000034
Warning: there may be numerical errors.
Elapsed time is 34.537983 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...A feasible solution is found:
gamma2: 45.925284
Elapsed time is 0.540959 seconds.

Tring deg 3 ...A feasible solution is found:
gamma2: 45.935571
Elapsed time is 1.192625 seconds.

Tring deg 4 ...No solution is found.
Elapsed time is 1.951339 seconds.

Tring deg 5 ...No solution is found.
Elapsed time is 2.794634 seconds.

Tring deg 6 ...No solution is found.
Elapsed time is 3.975901 seconds.

Tring deg 7 ...No solution is found.
Elapsed time is 5.557819 seconds.

Tring deg 8 ...No solution is found.
Elapsed time is 7.980899 seconds.

Tring deg 9 ...No solution is found.
Elapsed time is 11.560274 seconds.

Tring deg 10 ...A feasible solution is found:
gamma2: 0.013915
Warning: there may be numerical errors.
Elapsed time is 16.414893 seconds.

Tring deg 11 ...A feasible solution is found:
gamma2: 0.000136
Warning: there may be numerical errors.
Elapsed time is 23.545409 seconds.

Tring deg 12 ...A feasible solution is found:
gamma2: 0.000011
Warning: there may be numerical errors.
Elapsed time is 33.793335 seconds.
=====================================    

==============Reach-Avoid=============
===============gamma1=================

Tring deg 2... No solution is found.
Elapsed time is 0.842434 seconds.

Tring deg 3... A feasible solution is found:
gamma1: 26.911968
Elapsed time is 1.502778 seconds.

Tring deg 4... A feasible solution is found:
gamma1: 24.138558
Elapsed time is 2.326139 seconds.

Tring deg 5... No solution is found.
Elapsed time is 3.284494 seconds.

Tring deg 6... No solution is found.
Elapsed time is 4.555861 seconds.

Tring deg 7... No solution is found.
Elapsed time is 6.362302 seconds.

Tring deg 8... No solution is found.
Elapsed time is 8.831672 seconds.

Tring deg 9... No solution is found.
Elapsed time is 12.562197 seconds.

Tring deg 10... A feasible solution is found:
gamma1: 0.000784
Warning: there may be numerical errors.
Elapsed time is 17.970443 seconds.

Tring deg 11... A feasible solution is found:
gamma1: 0.000206
Warning: there may be numerical errors.
Elapsed time is 25.666661 seconds.

Tring deg 12... A feasible solution is found:
gamma1: -0.000151
Warning: there may be numerical errors.
Elapsed time is 36.524561 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...No solution is found.
Elapsed time is 0.585699 seconds.

Tring deg 3 ...A feasible solution is found:
gamma2: 45.855728
Elapsed time is 1.182117 seconds.

Tring deg 4 ...A feasible solution is found:
gamma2: 25.921593
Elapsed time is 1.969625 seconds.

Tring deg 5 ...No solution is found.
Elapsed time is 2.880465 seconds.

Tring deg 6 ...No solution is found.
Elapsed time is 4.191156 seconds.

Tring deg 7 ...No solution is found.
Elapsed time is 5.891488 seconds.

Tring deg 8 ...No solution is found.
Elapsed time is 8.432247 seconds.

Tring deg 9 ...No solution is found.
Elapsed time is 12.034403 seconds.

Tring deg 10 ...A feasible solution is found:
gamma2: 0.024789
Warning: there may be numerical errors.
Elapsed time is 17.244162 seconds.

Tring deg 11 ...A feasible solution is found:
gamma2: 0.005929
Warning: there may be numerical errors.
Elapsed time is 24.568481 seconds.

Tring deg 12 ...A feasible solution is found:
gamma2: 0.000012
Warning: there may be numerical errors.
Elapsed time is 35.046984 seconds.
=====================================

%}

