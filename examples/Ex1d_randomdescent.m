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

f1 = x1 + 0.2*(d-1);
f2 = 0;
f3 = 0;
f4 = 0;
f5 = 0;
f6 = 0;

if ra == 0
    S0 = @(x1,x2,x3,x4,x5,x6) -1; 
    Su = @(x1,x2,x3,x4,x5,x6) -1;
    St = @(x1,x2,x3,x4,x5,x6) -1;
    Sd = @(x1,x2,x3,x4,x5,x6) 1;
else 
    S0 = @(x1,x2,x3,x4,x5,x6) (x1-1.8)^2-0.2^2;
    Su = @(x1,x2,x3,x4,x5,x6) (x1-1)^2-0.1^2;
    St = @(x1,x2,x3,x4,x5,x6) (x1-0.2)^2-0.2^2;
    Sd = @(x1,x2,x3,x4,x5,x6) (x1-1)^2-1^2;
end

%{
0.1
==============Reach-Avoid=============
===============gamma1=================

Tring deg 2... A feasible solution is found:
gamma1: 20.000000
Elapsed time is 0.488884 seconds.

Tring deg 3... A feasible solution is found:
gamma1: 13.467526
Elapsed time is 0.966899 seconds.

Tring deg 4... A feasible solution is found:
gamma1: 13.467492
Elapsed time is 1.469634 seconds.

Tring deg 5... A feasible solution is found:
gamma1: 8.929341
Elapsed time is 1.963701 seconds.

Tring deg 6... A feasible solution is found:
gamma1: 8.283301
Elapsed time is 2.498785 seconds.

Tring deg 7... No solution is found.
Elapsed time is 3.026263 seconds.

Tring deg 8... No solution is found.
Elapsed time is 3.572802 seconds.

Tring deg 9... No solution is found.
Elapsed time is 4.150162 seconds.

Tring deg 10... No solution is found.
Elapsed time is 4.734746 seconds.

Tring deg 11... A feasible solution is found:
gamma1: 5.737198
Elapsed time is 5.343508 seconds.

Tring deg 12... No solution is found.
Elapsed time is 5.995686 seconds.

Tring deg 13... No solution is found.
Elapsed time is 6.658843 seconds.

Tring deg 14... No solution is found.
Elapsed time is 7.372043 seconds.

Tring deg 15... No solution is found.
Elapsed time is 8.163132 seconds.

Tring deg 16... No solution is found.
Elapsed time is 9.278232 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...A feasible solution is found:
gamma2: 20.000000
Elapsed time is 0.867302 seconds.

Tring deg 3 ...A feasible solution is found:
gamma2: 13.467526
Elapsed time is 1.560781 seconds.

Tring deg 4 ...A feasible solution is found:
gamma2: 13.467527
Elapsed time is 2.198688 seconds.

Tring deg 5 ...A feasible solution is found:
gamma2: 8.929340
Elapsed time is 2.861456 seconds.

Tring deg 6 ...A feasible solution is found:
gamma2: 8.298725
Elapsed time is 3.640612 seconds.

Tring deg 7 ...A feasible solution is found:
gamma2: 7.301103
Elapsed time is 4.612695 seconds.

Tring deg 8 ...No solution is found.
Elapsed time is 5.541349 seconds.

Tring deg 9 ...No solution is found.
Elapsed time is 6.399078 seconds.

Tring deg 10 ...No solution is found.
Elapsed time is 7.255681 seconds.

Tring deg 11 ...A feasible solution is found:
gamma2: 5.846832
Elapsed time is 8.392222 seconds.

Tring deg 12 ...No solution is found.
Elapsed time is 10.003270 seconds.

Tring deg 13 ...No solution is found.
Elapsed time is 11.000545 seconds.

Tring deg 14 ...No solution is found.
Elapsed time is 12.028065 seconds.

Tring deg 15 ...No solution is found.
Elapsed time is 13.059002 seconds.

Tring deg 16 ...No solution is found.
Elapsed time is 14.118286 seconds.
=====================================

0.2
==============Reach-Avoid=============
===============gamma1=================

Tring deg 2... A feasible solution is found:
gamma1: 9.666667
Elapsed time is 0.490917 seconds.

Tring deg 3... A feasible solution is found:
gamma1: 6.732111
Elapsed time is 0.961821 seconds.

Tring deg 4... A feasible solution is found:
gamma1: 6.732106
Elapsed time is 1.446213 seconds.

Tring deg 5... A feasible solution is found:
gamma1: 4.671579
Elapsed time is 1.936751 seconds.

Tring deg 6... No solution is found.
Elapsed time is 2.461335 seconds.

Tring deg 7... A feasible solution is found:
gamma1: 3.686751
Elapsed time is 3.041160 seconds.

Tring deg 8... No solution is found.
Elapsed time is 3.586099 seconds.

Tring deg 9... No solution is found.
Elapsed time is 4.140665 seconds.

Tring deg 10... A feasible solution is found:
gamma1: 2.978709
Elapsed time is 4.723799 seconds.

Tring deg 11... A feasible solution is found:
gamma1: 2.968180
Elapsed time is 5.328317 seconds.

Tring deg 12... No solution is found.
Elapsed time is 5.988570 seconds.

Tring deg 13... A feasible solution is found:
gamma1: 2.344726
Elapsed time is 6.648075 seconds.

Tring deg 14... No solution is found.
Elapsed time is 7.352175 seconds.

Tring deg 15... No solution is found.
Elapsed time is 8.095480 seconds.

Tring deg 16... No solution is found.
Elapsed time is 8.941228 seconds.
=====================================

===============gamma2=================

Tring deg 2 ...A feasible solution is found:
gamma2: 9.666666
Elapsed time is 0.458827 seconds.

Tring deg 3 ...A feasible solution is found:
gamma2: 6.732111
Elapsed time is 0.932057 seconds.

Tring deg 4 ...A feasible solution is found:
gamma2: 6.731757
Elapsed time is 1.418161 seconds.

Tring deg 5 ...A feasible solution is found:
gamma2: 4.671578
Elapsed time is 1.909855 seconds.

Tring deg 6 ...A feasible solution is found:
gamma2: 3.976979
Elapsed time is 2.411575 seconds.

Tring deg 7 ...A feasible solution is found:
gamma2: 3.673767
Elapsed time is 2.944480 seconds.

Tring deg 8 ...No solution is found.
Elapsed time is 3.512546 seconds.

Tring deg 9 ...No solution is found.
Elapsed time is 4.083476 seconds.

Tring deg 10 ...No solution is found.
Elapsed time is 4.671967 seconds.

Tring deg 11 ...No solution is found.
Elapsed time is 5.288100 seconds.

Tring deg 12 ...A feasible solution is found:
gamma2: 2.783250
Elapsed time is 5.927765 seconds.

Tring deg 13 ...No solution is found.
Elapsed time is 7.443482 seconds.

Tring deg 14 ...No solution is found.
Elapsed time is 8.167556 seconds.

Tring deg 15 ...A feasible solution is found:
gamma2: 2.565203
Elapsed time is 8.924173 seconds.

Tring deg 16 ...A feasible solution is found:
gamma2: 2.452683
Elapsed time is 9.719001 seconds.
=====================================

%}