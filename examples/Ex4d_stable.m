function [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex4d_stable(vars,ra)

% adapted from Sriram13
% only safety

dim = 4;

x1 = vars(1);
x2 = vars(2);
x3 = vars(3);
x4 = vars(4);
x5 = vars(5);
x6 = vars(6);
d  = vars(7);

t = 0.1;

f1 = x1 + (x1+x2*d+x2^3-2*x3*x4)*t;
f2 = x2 + (x1+x1*d-x2^3)*t;
f3 = x3 + (x1*x4-x3)*t;
f4 = x4 + (x1*x3-x4^3)*t;
f5 = 0;
f6 = 0;

if ra == 0
    % gamma1 = 0.3 (deg 5)
    % gamma2 = 7.0 (deg 6) 
    S0 = @(x1,x2,x3,x4,x5,x6) (x1-0)^2+(x2-0)^2+(x3-0)^2+(x4-0)^2-0.3^2; 
    Su = @(x1,x2,x3,x4,x5,x6) (x1+0.6)^2+(x2+0.6)^2+(x3+0.6)^2-0.2^2;
    St = @(x1,x2,x3,x4,x5,x6) -1;
    Sd = @(x1,x2,x3,x4,x5,x6) x1^2+x2^2+x3^2+x4^2-1^2;
else
    S0 = @(x1,x2,x3,x4,x5,x6) -1; 
    Su = @(x1,x2,x3,x4,x5,x6) -1;
    St = @(x1,x2,x3,x4,x5,x6) -1;
    Sd = @(x1,x2,x3,x4,x5,x6) 1;
end

            
%{
================Safety==================
===============gamma1=================

Tring deg 2... No solution is found.
Elapsed time is 2.100484 seconds.

Tring deg 3... No solution is found.
Elapsed time is 5.232990 seconds.

Tring deg 4... No solution is found.
Elapsed time is 16.197692 seconds.

Tring deg 5... A feasible solution is found:
gamma1: 0.309170
Elapsed time is 53.902437 seconds.

Tring deg 6... A feasible solution is found:
gamma1: 0.060636
Warning: there may be numerical errors.
Elapsed time is 270.790088 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...No solution is found.
Elapsed time is 2.122692 seconds.

Tring deg 3 ...No solution is found.
Elapsed time is 5.367905 seconds.

Tring deg 4 ...A feasible solution is found:
gamma2: 13.915846
Elapsed time is 16.950751 seconds.

Tring deg 5 ...No solution is found.
Elapsed time is 55.810634 seconds.

Tring deg 6 ...A feasible solution is found:
gamma2: 7.039733
Elapsed time is 278.869196 seconds.
=====================================
%}