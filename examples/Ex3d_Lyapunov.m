function [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex3d_lyapunov(vars, ra)

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
            
%{
================Safety==================
===============gamma1=================

Tring deg 2... No solution is found.
Elapsed time is 0.899683 seconds.

Tring deg 3... No solution is found.
Elapsed time is 2.015791 seconds.

Tring deg 4... No solution is found.
Elapsed time is 4.166459 seconds.

Tring deg 5... No solution is found.
Elapsed time is 7.995331 seconds.

Tring deg 6... No solution is found.
Elapsed time is 17.107778 seconds.

Tring deg 7... No solution is found.
Elapsed time is 39.311583 seconds.

Tring deg 8... A feasible solution is found:
gamma1: 3.231004
Elapsed time is 98.288816 seconds.

Tring deg 9... A feasible solution is found:
gamma1: 2.525757
Elapsed time is 278.708509 seconds.

Tring deg 10... A feasible solution is found:
gamma1: 1.989777
Elapsed time is 768.499763 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...No solution is found.
Elapsed time is 0.869376 seconds.

Tring deg 3 ...No solution is found.
Elapsed time is 1.933332 seconds.

Tring deg 4 ...A feasible solution is found:
gamma2: 35.947863
Elapsed time is 4.160286 seconds.

Tring deg 5 ...A feasible solution is found:
gamma2: 31.238984
Elapsed time is 7.916736 seconds.

Tring deg 6 ...A feasible solution is found:
gamma2: 14.889106
Elapsed time is 17.047540 seconds.

Tring deg 7 ...A feasible solution is found:
gamma2: 13.702397
Elapsed time is 40.364155 seconds.

Tring deg 8 ...A feasible solution is found:
gamma2: 10.322438
Elapsed time is 102.036227 seconds.

Tring deg 9 ...A feasible solution is found:
gamma2: 9.051774
Elapsed time is 277.140456 seconds.

Tring deg 10 ...A feasible solution is found:
gamma2: 7.357475
Elapsed time is 767.575346 seconds.
=====================================

%}