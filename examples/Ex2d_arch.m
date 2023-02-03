function [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex2d_arch(vars,ra)

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

f1 = x1+(x1-x1^3+x2*d-x1*x2^2)*t;
f2 = x2+(-x1+x2*d-x1^2*x2-x2^3)*t;
f3 = 0;
f4 = 0;
f5 = 0;
f6 = 0;

if ra == 1
    fprintf("Error: not a reach-avoid example.\n");
    return 
end
% only safety
S0 = @(x1,x2,x3,x4,x5,x6) (x1+0)^2+(x2+0)^2-0.2^2;
Su = @(x1,x2,x3,x4,x5,x6) (x1-0.5)^2+(x2-0.5)^2-0.2^2;
St = @(x1,x2,x3,x4,x5,x6) -1;%(x1+0)^2+(x2+0)^2-0.1^2;
Sd = @(x1,x2,x3,x4,x5,x6) (x1+0)^2+(x2+0)^2-1^2;
    

%{
================Safety==================
===============gamma1=================

Tring deg 2... A feasible solution is found:
gamma1: 36.821084
Elapsed time is 0.592675 seconds.

Tring deg 3... A feasible solution is found:
gamma1: 36.846686
Elapsed time is 1.246118 seconds.

Tring deg 4... No solution is found.
Elapsed time is 2.329886 seconds.

Tring deg 5... A feasible solution is found:
gamma1: 13.676868
Elapsed time is 3.789941 seconds.

Tring deg 6... A feasible solution is found:
gamma1: 2.854862
Elapsed time is 6.387631 seconds.

Tring deg 7... No solution is found.
Elapsed time is 11.651790 seconds.

Tring deg 8... No solution is found.
Elapsed time is 21.464265 seconds.

Tring deg 9... A feasible solution is found:
gamma1: 1.545788
Elapsed time is 40.941324 seconds.

Tring deg 10... A feasible solution is found:
gamma1: 1.068405
Elapsed time is 79.864262 seconds.

Tring deg 11... A feasible solution is found:
gamma1: 1.068097
Elapsed time is 159.469153 seconds.

Tring deg 12... A feasible solution is found:
gamma1: 0.978202
Elapsed time is 318.093735 seconds.
=====================================
===============gamma2=================

Tring deg 2 ...A feasible solution is found:
gamma2: 50.168350
Elapsed time is 0.667124 seconds.

Tring deg 3 ...A feasible solution is found:
gamma2: 50.163494
Elapsed time is 1.379695 seconds.

Tring deg 4 ...No solution is found.
Elapsed time is 2.427773 seconds.

Tring deg 5 ...A feasible solution is found:
gamma2: 37.298794
Elapsed time is 3.910308 seconds.

Tring deg 6 ...A feasible solution is found:
gamma2: 17.213281
Elapsed time is 7.175800 seconds.

Tring deg 7 ...A feasible solution is found:
gamma2: 15.835612
Elapsed time is 12.558353 seconds.

Tring deg 8 ...No solution is found.
Elapsed time is 22.851144 seconds.

Tring deg 9 ...A feasible solution is found:
gamma2: 11.664168
Elapsed time is 43.286961 seconds.

Tring deg 10 ...A feasible solution is found:
gamma2: 10.113146
Elapsed time is 82.463187 seconds.

Tring deg 11 ...A feasible solution is found:
gamma2: 10.113617
Elapsed time is 166.476053 seconds.

Tring deg 12 ...A feasible solution is found:
gamma2: 9.818697
Elapsed time is 325.343957 seconds.
=====================================
%}