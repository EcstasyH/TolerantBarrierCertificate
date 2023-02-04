function  [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex1d_randomwalk(vars,ra)

% random walk with bias
dim = 1;

x1 = vars(1);
x2 = vars(2);
x3 = vars(3);
x4 = vars(4);
x5 = vars(5);
x6 = vars(6);
d  = vars(7);

%bias = 0.1;
bias = 0.2;

f1 = x1 + 0.4*(d-bias);
f2 = 0;
f3 = 0;
f4 = 0;
f5 = 0;
f6 = 0;

if ra == 0
%    S0 = @(x1,x2,x3,x4,x5,x6) (x1-0.25)^2-0.1^2;
    S0 = @(x1,x2,x3,x4,x5,x6) (x1-0.5)^2-0.1^2;
    Su = @(x1,x2,x3,x4,x5,x6) (x1-1)^2-0.2^2;
    St = @(x1,x2,x3,x4,x5,x6) -1;
%    Sd = @(x1,x2,x3,x4,x5,x6) (x1-1)^2-1.5^2;
    Sd = @(x1,x2,x3,x4,x5,x6) (x1)^2-2^2;
else 
    S0 = @(x1,x2,x3,x4,x5,x6) -1; 
    Su = @(x1,x2,x3,x4,x5,x6) -1;
    St = @(x1,x2,x3,x4,x5,x6) -1;
    Sd = @(x1,x2,x3,x4,x5,x6) 1;
end

%{
    0.1
================Safety==================
===============gamma1=================

Tring deg 2... A feasible solution is found:
gamma1: 46.119048
Elapsed time is 0.486731 seconds.

Tring deg 3... A feasible solution is found:
gamma1: 38.821276
Elapsed time is 1.022084 seconds.

Tring deg 4... A feasible solution is found:
gamma1: 24.868256
Elapsed time is 1.539194 seconds.

Tring deg 5... A feasible solution is found:
gamma1: 20.495672
Elapsed time is 2.055809 seconds.

Tring deg 6... No solution is found.
Elapsed time is 2.577093 seconds.

Tring deg 7... No solution is found.
Elapsed time is 3.108678 seconds.

Tring deg 8... No solution is found.
Elapsed time is 3.713595 seconds.

Tring deg 9... No solution is found.
Elapsed time is 4.323834 seconds.

Tring deg 10... A feasible solution is found:
gamma1: 11.987808
Elapsed time is 4.917572 seconds.

Tring deg 11... No solution is found.
Elapsed time is 5.522925 seconds.

Tring deg 12... A feasible solution is found:
gamma1: 10.461284
Elapsed time is 6.196687 seconds.

Tring deg 13... A feasible solution is found:
gamma1: 9.643824
Elapsed time is 6.880616 seconds.

Tring deg 14... No solution is found.
Elapsed time is 7.625425 seconds.

Tring deg 15... A feasible solution is found:
gamma1: 8.142143
Elapsed time is 8.456938 seconds.

Tring deg 16... A feasible solution is found:
gamma1: 7.681566
Elapsed time is 9.394863 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...A feasible solution is found:
gamma2: 95.952381
Elapsed time is 0.440939 seconds.

Tring deg 3 ...A feasible solution is found:
gamma2: 76.043914
Elapsed time is 0.883143 seconds.

Tring deg 4 ...A feasible solution is found:
gamma2: 28.169502
Elapsed time is 1.339270 seconds.

Tring deg 5 ...A feasible solution is found:
gamma2: 26.982326
Elapsed time is 1.806654 seconds.

Tring deg 6 ...No solution is found.
Elapsed time is 2.306375 seconds.

Tring deg 7 ...A feasible solution is found:
gamma2: 24.154796
Elapsed time is 2.816479 seconds.

Tring deg 8 ...A feasible solution is found:
gamma2: 20.869340
Elapsed time is 3.340771 seconds.

Tring deg 9 ...A feasible solution is found:
gamma2: 18.989671
Elapsed time is 3.880376 seconds.

Tring deg 10 ...No solution is found.
Elapsed time is 4.439176 seconds.

Tring deg 11 ...No solution is found.
Elapsed time is 5.025593 seconds.

Tring deg 12 ...No solution is found.
Elapsed time is 5.675419 seconds.

Tring deg 13 ...No solution is found.
Elapsed time is 6.353931 seconds.

Tring deg 14 ...No solution is found.
Elapsed time is 7.120769 seconds.

Tring deg 15 ...No solution is found.
Elapsed time is 7.949348 seconds.

Tring deg 16 ...No solution is found.
Elapsed time is 8.872908 seconds.
=====================================

0.2
================Safety==================
===============gamma1=================

Tring deg 2... A feasible solution is found:
gamma1: 19.422618
Elapsed time is 0.514749 seconds.

Tring deg 3... A feasible solution is found:
gamma1: 10.975269
Elapsed time is 0.959338 seconds.

Tring deg 4... A feasible solution is found:
gamma1: 9.601978
Elapsed time is 1.440437 seconds.

Tring deg 5... A feasible solution is found:
gamma1: 9.360994
Elapsed time is 1.912722 seconds.

Tring deg 6... A feasible solution is found:
gamma1: 7.349622
Elapsed time is 2.405847 seconds.

Tring deg 7... A feasible solution is found:
gamma1: 7.040069
Elapsed time is 2.911741 seconds.

Tring deg 8... A feasible solution is found:
gamma1: 6.698579
Elapsed time is 3.441935 seconds.

Tring deg 9... A feasible solution is found:
gamma1: 6.648173
Elapsed time is 4.007488 seconds.

Tring deg 10... A feasible solution is found:
gamma1: 5.516979
Elapsed time is 4.562933 seconds.

Tring deg 11... A feasible solution is found:
gamma1: 5.040028
Elapsed time is 5.144763 seconds.

Tring deg 12... A feasible solution is found:
gamma1: 4.964546
Elapsed time is 5.756116 seconds.

Tring deg 13... A feasible solution is found:
gamma1: 4.519715
Elapsed time is 6.404797 seconds.

Tring deg 14... A feasible solution is found:
gamma1: 4.326013
Elapsed time is 7.113786 seconds.

Tring deg 15... A feasible solution is found:
gamma1: 4.128888
Elapsed time is 7.885660 seconds.

Tring deg 16... No solution is found.
Elapsed time is 8.771303 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...A feasible solution is found:
gamma2: 42.380952
Elapsed time is 0.443324 seconds.

Tring deg 3 ...A feasible solution is found:
gamma2: 40.123007
Elapsed time is 0.898494 seconds.

Tring deg 4 ...A feasible solution is found:
gamma2: 21.398137
Elapsed time is 1.375806 seconds.

Tring deg 5 ...A feasible solution is found:
gamma2: 19.070024
Elapsed time is 1.847448 seconds.

Tring deg 6 ...A feasible solution is found:
gamma2: 17.841782
Elapsed time is 2.366118 seconds.

Tring deg 7 ...A feasible solution is found:
gamma2: 17.810965
Elapsed time is 2.869559 seconds.

Tring deg 8 ...A feasible solution is found:
gamma2: 14.304374
Elapsed time is 3.395230 seconds.

Tring deg 9 ...No solution is found.
Elapsed time is 3.938400 seconds.

Tring deg 10 ...A feasible solution is found:
gamma2: 10.630104
Elapsed time is 4.506625 seconds.

Tring deg 11 ...A feasible solution is found:
gamma2: 10.693660
Elapsed time is 5.079839 seconds.

Tring deg 12 ...No solution is found.
Elapsed time is 5.703613 seconds.

Tring deg 13 ...No solution is found.
Elapsed time is 6.347105 seconds.

Tring deg 14 ...A feasible solution is found:
gamma2: 8.429707
Elapsed time is 7.050463 seconds.

Tring deg 15 ...No solution is found.
Elapsed time is 7.820077 seconds.

Tring deg 16 ...No solution is found.
Elapsed time is 8.658438 seconds.
=====================================
%}