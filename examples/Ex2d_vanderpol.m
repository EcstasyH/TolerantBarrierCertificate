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

f1 = x1 - t*2*x2;
f2 = x2 + t*(x1+0.5*(x1^2+1-d)*x2);
f3 = 0;
f4 = 0;
f5 = 0;
f6 = 0;

if ra == 0
    S0 = @(x1,x2,x3,x4,x5,x6) (x1+2)^2+(x2+0)^2-0.5^2;
    Su = @(x1,x2,x3,x4,x5,x6) 10*(x1-0)^2+10*(x2-1)^2-1;
    St = @(x1,x2,x3,x4,x5,x6) 10*(x1-0)^2+10*(x2-0)^2-1;
    Sd = @(x1,x2,x3,x4,x5,x6) (x1-0)^2+(x2-0)^2-10;
else
    S0 = @(x1,x2,x3,x4,x5,x6) (x1)^2+(x2-0.4)^2-0.2^2;
    Su = @(x1,x2,x3,x4,x5,x6) (x1+0.6)^2+(x2)^2-0.2^2;
    St = @(x1,x2,x3,x4,x5,x6) x1^2+x2^2-0.1^2;
    Sd = @(x1,x2,x3,x4,x5,x6) x1^2+x2^2-1;
end
    
%{
==============Reach-Avoid===============
===============gamma1=================

Tring deg 2... A feasible solution is found:
gamma1: 93.505789
Elapsed time is 0.596162 seconds.

Tring deg 3... A feasible solution is found:
gamma1: 86.828742
Elapsed time is 1.191659 seconds.

Tring deg 4... A feasible solution is found:
gamma1: 62.639328
Elapsed time is 1.916128 seconds.

Tring deg 5... A feasible solution is found:
gamma1: 29.969121
Elapsed time is 2.729748 seconds.

Tring deg 6... A feasible solution is found:
gamma1: 24.633323
Elapsed time is 3.686594 seconds.

Tring deg 7... A feasible solution is found:
gamma1: 21.221601
Elapsed time is 4.846996 seconds.

Tring deg 8... A feasible solution is found:
gamma1: 18.585816
Elapsed time is 6.277202 seconds.

Tring deg 9... A feasible solution is found:
gamma1: 17.642591
Elapsed time is 8.161128 seconds.

Tring deg 10... A feasible solution is found:
gamma1: 16.738276
Elapsed time is 10.439030 seconds.

Tring deg 11... A feasible solution is found:
gamma1: 16.540685
Elapsed time is 13.311797 seconds.

Tring deg 12... A feasible solution is found:
gamma1: 16.367919
Elapsed time is 17.155289 seconds.
===============gamma2=================

Tring deg 2 ...A feasible solution is found:
gamma2: 95.913774
Elapsed time is 0.562523 seconds.

Tring deg 3 ...A feasible solution is found:
gamma2: 88.767781
Elapsed time is 1.177865 seconds.

Tring deg 4 ...A feasible solution is found:
gamma2: 64.457837
Elapsed time is 1.885523 seconds.

Tring deg 5 ...A feasible solution is found:
gamma2: 32.031146
Elapsed time is 2.670965 seconds.

Tring deg 6 ...A feasible solution is found:
gamma2: 26.202757
Elapsed time is 3.596462 seconds.

Tring deg 7 ...A feasible solution is found:
gamma2: 23.330216
Elapsed time is 4.759323 seconds.

Tring deg 8 ...A feasible solution is found:
gamma2: 20.594242
Elapsed time is 6.202234 seconds.

Tring deg 9 ...A feasible solution is found:
gamma2: 19.666067
Elapsed time is 8.160919 seconds.

Tring deg 10 ...A feasible solution is found:
gamma2: 18.761498
Elapsed time is 10.485335 seconds.

Tring deg 11 ...A feasible solution is found:
gamma2: 18.455494
Elapsed time is 13.513811 seconds.

Tring deg 12 ...A feasible solution is found:
gamma2: 18.264688
Elapsed time is 17.495907 seconds.
=====================================
%}
%