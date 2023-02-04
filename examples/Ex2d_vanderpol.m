function  [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex2d_vanderpol(vars,ra)
    
    
dim = 2;
 
x1 = vars(1);
x2 = vars(2);
x3 = vars(3);
x4 = vars(4); 
x5 = vars(5);
x6 = vars(6);
d  = vars(7);

t = 0.1;

%f1 = x1 - t*2*x2;
%f2 = x2 + t*(0.8*x1+10*x1^2*x2-(2+d)*x2);
f1 = x1 - t*2*x2;
f2 = x2 + t*(x1+0.5*(x1^2-1-d)*x2);
f3 = 0;
f4 = 0;
f5 = 0;
f6 = 0;

if ra == 0
    S0 = @(x1,x2,x3,x4,x5,x6) 1;
    Su = @(x1,x2,x3,x4,x5,x6) 1;
    St = @(x1,x2,x3,x4,x5,x6) 1;
    Sd = @(x1,x2,x3,x4,x5,x6) -1;
else
    S0 = @(x1,x2,x3,x4,x5,x6) (x1)^2+(x2-0.4)^2-0.2^2;
    Su = @(x1,x2,x3,x4,x5,x6) (x1+0.6)^2+(x2)^2-0.1^2;
    St = @(x1,x2,x3,x4,x5,x6) x1^2+x2^2-0.1^2;
    Sd = @(x1,x2,x3,x4,x5,x6) x1^2+x2^2-1;
end
    
%{
==============Reach-Avoid===============
===============gamma1=================

Tring deg 2... No solution is found.
Elapsed time is 0.888643 seconds.

Tring deg 3... No solution is found.
Elapsed time is 1.817037 seconds.

Tring deg 4... No solution is found.
Elapsed time is 3.023776 seconds.

Tring deg 5... A feasible solution is found:
gamma1: 35.502827
Elapsed time is 4.347033 seconds.

Tring deg 6... A feasible solution is found:
gamma1: 27.283052
Elapsed time is 6.203162 seconds.

Tring deg 7... A feasible solution is found:
gamma1: 25.123005
Elapsed time is 8.120381 seconds.

Tring deg 8... A feasible solution is found:
gamma1: 22.748974
Elapsed time is 10.331659 seconds.

Tring deg 9... A feasible solution is found:
gamma1: 22.095793
Elapsed time is 13.098181 seconds.

Tring deg 10... A feasible solution is found:
gamma1: 21.733189
Elapsed time is 16.705488 seconds.

Tring deg 11... A feasible solution is found:
gamma1: 21.408881
Elapsed time is 21.405022 seconds.

Tring deg 12... A feasible solution is found:
gamma1: 21.103056
Elapsed time is 27.280492 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...No solution is found.
Elapsed time is 0.863021 seconds.

Tring deg 3 ...No solution is found.
Elapsed time is 1.792777 seconds.

Tring deg 4 ...No solution is found.
Elapsed time is 2.931661 seconds.

Tring deg 5 ...A feasible solution is found:
gamma2: 85.152530
Elapsed time is 4.151898 seconds.

Tring deg 6 ...A feasible solution is found:
gamma2: 37.427546
Elapsed time is 5.603893 seconds.

Tring deg 7 ...A feasible solution is found:
gamma2: 33.609327
Elapsed time is 7.633451 seconds.

Tring deg 8 ...A feasible solution is found:
gamma2: 30.260969
Elapsed time is 9.809266 seconds.

Tring deg 9 ...A feasible solution is found:
gamma2: 27.258685
Elapsed time is 12.668268 seconds.

Tring deg 10 ...A feasible solution is found:
gamma2: 26.100958
Elapsed time is 16.186542 seconds.

Tring deg 11 ...A feasible solution is found:
gamma2: 24.888248
Elapsed time is 20.660529 seconds.

Tring deg 12 ...A feasible solution is found:
gamma2: 24.385179
Elapsed time is 26.501156 seconds.
=====================================
%}
%