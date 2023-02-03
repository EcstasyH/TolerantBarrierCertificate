function [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex3d_lotka(vars,ra)

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
            

%{
================Safety==================
===============gamma1=================

Tring deg 2... No solution is found.
Elapsed time is 0.984624 seconds.

Tring deg 3... No solution is found.
Elapsed time is 2.026772 seconds.

Tring deg 4... No solution is found.
Elapsed time is 3.993460 seconds.

Tring deg 5... No solution is found.
Elapsed time is 6.398127 seconds.

Tring deg 6... No solution is found.
Elapsed time is 11.383464 seconds.

Tring deg 7... No solution is found.
Elapsed time is 17.403337 seconds.

Tring deg 8... A feasible solution is found:
gamma1: 12.669412
Elapsed time is 34.026622 seconds.

Tring deg 9... No solution is found.
Elapsed time is 56.955840 seconds.

Tring deg 10... A feasible solution is found:
gamma1: 9.723885
Elapsed time is 115.248916 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...No solution is found.
Elapsed time is 0.854160 seconds.

Tring deg 3 ...No solution is found.
Elapsed time is 1.876755 seconds.

Tring deg 4 ...No solution is found.
Elapsed time is 3.868927 seconds.

Tring deg 5 ...No solution is found.
Elapsed time is 6.559396 seconds.

Tring deg 6 ...A feasible solution is found:
gamma2: 51.719546
Elapsed time is 11.188300 seconds.

Tring deg 7 ...No solution is found.
Elapsed time is 17.180449 seconds.

Tring deg 8 ...A feasible solution is found:
gamma2: 20.052611
Elapsed time is 32.741792 seconds.

Tring deg 9 ...No solution is found.
Elapsed time is 55.956078 seconds.

Tring deg 10 ...A feasible solution is found:
gamma2: 18.000317
Elapsed time is 118.461423 seconds.
=====================================    

==============Reach-Avoid=============
===============gamma1=================

Tring deg 2... No solution is found.
Elapsed time is 1.090662 seconds.

Tring deg 3... No solution is found.
Elapsed time is 2.237768 seconds.

Tring deg 4... No solution is found.
Elapsed time is 4.134065 seconds.

Tring deg 5... No solution is found.
Elapsed time is 7.014189 seconds.

Tring deg 6... A feasible solution is found:
gamma1: 20.993156
Elapsed time is 12.686439 seconds.

Tring deg 7... No solution is found.
Elapsed time is 18.634126 seconds.

Tring deg 8... A feasible solution is found:
gamma1: 9.809878
Elapsed time is 36.139062 seconds.

Tring deg 9... No solution is found.
Elapsed time is 59.303311 seconds.

Tring deg 10... A feasible solution is found:
gamma1: 6.904947
Elapsed time is 118.841763 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...No solution is found.
Elapsed time is 0.935339 seconds.

Tring deg 3 ...No solution is found.
Elapsed time is 2.014265 seconds.

Tring deg 4 ...No solution is found.
Elapsed time is 3.922046 seconds.

Tring deg 5 ...No solution is found.
Elapsed time is 6.815796 seconds.

Tring deg 6 ...No solution is found.
Elapsed time is 11.895754 seconds.

Tring deg 7 ...No solution is found.
Elapsed time is 17.886668 seconds.

Tring deg 8 ...A feasible solution is found:
gamma2: 16.847606
Elapsed time is 34.522334 seconds.

Tring deg 9 ...No solution is found.
Elapsed time is 57.925648 seconds.

Tring deg 10 ...A feasible solution is found:
gamma2: 14.007871
Elapsed time is 117.270600 seconds.
=====================================
%}
