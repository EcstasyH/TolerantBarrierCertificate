function [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex2d_equil(vars,ra)

% adapted from Prajna07TAC
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

f1 = x1+(x2+0.2*d*x1)*t;
f2 = x2+(-x1+1/3*x1^3-x2)*t;
f3 = 0;
f4 = 0;
f5 = 0;
f6 = 0;

S0 = @(x1,x2,x3,x4,x5,x6) (x1+1)^2+(x2+0.8)^2-0.2^2;
Su = @(x1,x2,x3,x4,x5,x6) (x1+1)^2+(x2+1)^2-0.8^2;
St = @(x1,x2,x3,x4,x5,x6) (x1+0)^2+(x2+0)^2-0.1^2;
Sd = @(x1,x2,x3,x4,x5,x6) (x1+0)^2+(x2+0)^2-2^2;

%{
================Safety==================
===============gamma1=================

Tring deg 2... No solution is found.
Elapsed time is 0.565870 seconds.

Tring deg 3... No solution is found.
Elapsed time is 1.320562 seconds.

Tring deg 4... No solution is found.
Elapsed time is 2.138171 seconds.

Tring deg 5... A feasible solution is found:
gamma1: 18.167266
Elapsed time is 3.088816 seconds.

Tring deg 6... A feasible solution is found:
gamma1: 11.122367
Elapsed time is 4.206353 seconds.

Tring deg 7... A feasible solution is found:
gamma1: 10.616003
Elapsed time is 5.613169 seconds.

Tring deg 8... A feasible solution is found:
gamma1: 9.355810
Elapsed time is 7.766838 seconds.

Tring deg 9... A feasible solution is found:
gamma1: 8.971130
Elapsed time is 10.551072 seconds.

Tring deg 10... A feasible solution is found:
gamma1: 8.705350
Elapsed time is 14.248522 seconds.

Tring deg 11... A feasible solution is found:
gamma1: 8.529840
Elapsed time is 19.511809 seconds.

Tring deg 12... A feasible solution is found:
gamma1: 8.280436
Elapsed time is 26.747288 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...No solution is found.
Elapsed time is 0.551162 seconds.

Tring deg 3 ...No solution is found.
Elapsed time is 1.139445 seconds.

Tring deg 4 ...A feasible solution is found:
gamma2: 34.712182
Elapsed time is 1.971278 seconds.

Tring deg 5 ...A feasible solution is found:
gamma2: 29.635254
Elapsed time is 2.841867 seconds.

Tring deg 6 ...A feasible solution is found:
gamma2: 22.166212
Elapsed time is 3.931613 seconds.

Tring deg 7 ...A feasible solution is found:
gamma2: 20.047909
Elapsed time is 5.412555 seconds.

Tring deg 8 ...A feasible solution is found:
gamma2: 17.669665
Elapsed time is 7.308917 seconds.

Tring deg 9 ...A feasible solution is found:
gamma2: 16.770534
Elapsed time is 9.907782 seconds.

Tring deg 10 ...A feasible solution is found:
gamma2: 15.384060
Elapsed time is 13.518498 seconds.

Tring deg 11 ...A feasible solution is found:
gamma2: 14.697968
Elapsed time is 18.654865 seconds.

Tring deg 12 ...A feasible solution is found:
gamma2: 14.034563
Elapsed time is 25.449967 seconds.
=====================================

==============Reach-Avoid=============
===============gamma1=================

Tring deg 2... No solution is found.
Elapsed time is 0.609966 seconds.

Tring deg 3... No solution is found.
Elapsed time is 1.240963 seconds.

Tring deg 4... No solution is found.
Elapsed time is 2.044559 seconds.

Tring deg 5... No solution is found.
Elapsed time is 2.999369 seconds.

Tring deg 6... A feasible solution is found:
gamma1: 10.991085
Elapsed time is 4.255508 seconds.

Tring deg 7... No solution is found.
Elapsed time is 5.799849 seconds.

Tring deg 8... A feasible solution is found:
gamma1: 9.272956
Elapsed time is 7.844368 seconds.

Tring deg 9... A feasible solution is found:
gamma1: 8.890642
Elapsed time is 10.843640 seconds.

Tring deg 10... A feasible solution is found:
gamma1: 8.687853
Elapsed time is 14.777273 seconds.

Tring deg 11... A feasible solution is found:
gamma1: 8.478560
Elapsed time is 20.271109 seconds.

Tring deg 12... A feasible solution is found:
gamma1: 8.339778
Elapsed time is 27.484736 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...No solution is found.
Elapsed time is 0.621853 seconds.

Tring deg 3 ...No solution is found.
Elapsed time is 1.250456 seconds.

Tring deg 4 ...A feasible solution is found:
gamma2: 33.295365
Elapsed time is 2.032158 seconds.

Tring deg 5 ...A feasible solution is found:
gamma2: 28.654694
Elapsed time is 2.917965 seconds.

Tring deg 6 ...A feasible solution is found:
gamma2: 21.807268
Elapsed time is 4.102784 seconds.

Tring deg 7 ...A feasible solution is found:
gamma2: 19.658290
Elapsed time is 5.624633 seconds.

Tring deg 8 ...A feasible solution is found:
gamma2: 17.554369
Elapsed time is 7.634016 seconds.

Tring deg 9 ...A feasible solution is found:
gamma2: 16.457463
Elapsed time is 10.494227 seconds.

Tring deg 10 ...A feasible solution is found:
gamma2: 15.198441
Elapsed time is 14.297618 seconds.

Tring deg 11 ...A feasible solution is found:
gamma2: 14.575404
Elapsed time is 19.632442 seconds.

Tring deg 12 ...A feasible solution is found:
gamma2: 14.030465
Elapsed time is 26.805589 seconds.
=====================================
%}