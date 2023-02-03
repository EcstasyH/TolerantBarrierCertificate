function  [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex2d_lie(vars,ra)
    
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
f1 = x1+(-2*x2)*t;
f2 = x2+x1^2*t+t*d*x1;
f3 = 0;
f4 = 0;
f5 = 0;
f6 = 0;

if ra == 0
    S0 = @(x1,x2,x3,x4,x5,x6) (x1-0)^2+(x2+0.5)^2-0.1^2;
    Su = @(x1,x2,x3,x4,x5,x6) (x1-0.5)^2+(x2-0.75)^2-0.4^2;
    St = @(x1,x2,x3,x4,x5,x6) -1;
    Sd = @(x1,x2,x3,x4,x5,x6) (x1+0)^2+(x2+0)^2-1.5^2;
else
    S0 = @(x1,x2,x3,x4,x5,x6) (x1-0)^2+(x2+0.5)^2-0.1^2;
    Su = @(x1,x2,x3,x4,x5,x6) (x1-0.5)^2+(x2-0.75)^2-0.1^2;
    St = @(x1,x2,x3,x4,x5,x6) (x1+1)^2 +(x2-1)^2 -0.4^2;
    Sd = @(x1,x2,x3,x4,x5,x6) (x1+0)^2+(x2+0)^2-1.5^2;
end

%{
================Safety==================
===============gamma1=================

Tring deg 2... A feasible solution is found:
gamma1: 40.537831
Elapsed time is 0.610997 seconds.

Tring deg 3... A feasible solution is found:
gamma1: 28.363578
Elapsed time is 1.198361 seconds.

Tring deg 4... A feasible solution is found:
gamma1: 21.775601
Elapsed time is 1.900051 seconds.

Tring deg 5... A feasible solution is found:
gamma1: 18.391226
Elapsed time is 2.724390 seconds.

Tring deg 6... A feasible solution is found:
gamma1: 13.526238
Elapsed time is 3.846902 seconds.

Tring deg 7... A feasible solution is found:
gamma1: 11.340099
Elapsed time is 5.329071 seconds.

Tring deg 8... A feasible solution is found:
gamma1: 11.023109
Elapsed time is 7.474092 seconds.

Tring deg 9... A feasible solution is found:
gamma1: 10.642249
Elapsed time is 10.381029 seconds.

Tring deg 10... A feasible solution is found:
gamma1: 10.333184
Elapsed time is 14.928172 seconds.

Tring deg 11... A feasible solution is found:
gamma1: 10.160157
Elapsed time is 21.580107 seconds.

Tring deg 12... A feasible solution is found:
gamma1: 9.816148
Elapsed time is 32.084205 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...A feasible solution is found:
gamma2: 93.061164
Elapsed time is 0.609167 seconds.

Tring deg 3 ...A feasible solution is found:
gamma2: 60.307889
Elapsed time is 1.205634 seconds.

Tring deg 4 ...A feasible solution is found:
gamma2: 39.415445
Elapsed time is 1.882120 seconds.

Tring deg 5 ...A feasible solution is found:
gamma2: 21.496394
Elapsed time is 2.741924 seconds.

Tring deg 6 ...A feasible solution is found:
gamma2: 20.321729
Elapsed time is 3.865329 seconds.

Tring deg 7 ...No solution is found.
Elapsed time is 5.469920 seconds.

Tring deg 8 ...A feasible solution is found:
gamma2: 12.432769
Elapsed time is 7.590389 seconds.

Tring deg 9 ...A feasible solution is found:
gamma2: 11.769088
Elapsed time is 10.495713 seconds.

Tring deg 10 ...A feasible solution is found:
gamma2: 11.046353
Elapsed time is 15.206969 seconds.

Tring deg 11 ...A feasible solution is found:
gamma2: 10.772319
Elapsed time is 22.372910 seconds.

Tring deg 12 ...A feasible solution is found:
gamma2: 10.356520
Elapsed time is 32.994153 seconds.
===================================== 

==============Reach-Avoid=============
===============gamma1=================

Tring deg 2... A feasible solution is found:
gamma1: 16.207351
Elapsed time is 0.618742 seconds.

Tring deg 3... A feasible solution is found:
gamma1: 13.228287
Elapsed time is 1.262121 seconds.

Tring deg 4... A feasible solution is found:
gamma1: 10.825028
Elapsed time is 1.995876 seconds.

Tring deg 5... A feasible solution is found:
gamma1: 7.939461
Elapsed time is 2.858413 seconds.

Tring deg 6... A feasible solution is found:
gamma1: 7.291819
Elapsed time is 4.003807 seconds.

Tring deg 7... A feasible solution is found:
gamma1: 5.700001
Elapsed time is 5.566228 seconds.

Tring deg 8... A feasible solution is found:
gamma1: 5.055491
Elapsed time is 7.762463 seconds.

Tring deg 9... A feasible solution is found:
gamma1: 4.465700
Elapsed time is 10.925226 seconds.

Tring deg 10... A feasible solution is found:
gamma1: 4.114873
Elapsed time is 15.673090 seconds.

Tring deg 11... A feasible solution is found:
gamma1: 3.699229
Elapsed time is 22.857830 seconds.

Tring deg 12... A feasible solution is found:
gamma1: 3.456295
Elapsed time is 33.837322 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...A feasible solution is found:
gamma2: 37.777884
Elapsed time is 0.593312 seconds.

Tring deg 3 ...A feasible solution is found:
gamma2: 22.399106
Elapsed time is 1.255098 seconds.

Tring deg 4 ...A feasible solution is found:
gamma2: 17.239965
Elapsed time is 2.035083 seconds.

Tring deg 5 ...A feasible solution is found:
gamma2: 9.776865
Elapsed time is 2.889323 seconds.

Tring deg 6 ...A feasible solution is found:
gamma2: 8.132782
Elapsed time is 4.005043 seconds.

Tring deg 7 ...A feasible solution is found:
gamma2: 7.576741
Elapsed time is 5.551910 seconds.

Tring deg 8 ...A feasible solution is found:
gamma2: 5.568048
Elapsed time is 7.727633 seconds.

Tring deg 9 ...A feasible solution is found:
gamma2: 5.111640
Elapsed time is 10.838269 seconds.

Tring deg 10 ...A feasible solution is found:
gamma2: 4.694971
Elapsed time is 15.664777 seconds.

Tring deg 11 ...A feasible solution is found:
gamma2: 4.250720
Elapsed time is 22.905972 seconds.

Tring deg 12 ...A feasible solution is found:
gamma2: 3.967964
Elapsed time is 34.452998 seconds.
=====================================
%}