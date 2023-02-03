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

bias = 0.2;

f1 = x1 + 0.4*(d-bias);
f2 = 0;
f3 = 0;
f4 = 0;
f5 = 0;
f6 = 0;

if ra == 0
    S0 = @(x1,x2,x3,x4,x5,x6) (x1-0.25)^2-0.1^2;
    Su = @(x1,x2,x3,x4,x5,x6) (x1-1)^2-0.2^2;
    St = @(x1,x2,x3,x4,x5,x6) -1;
    Sd = @(x1,x2,x3,x4,x5,x6) (x1-1)^2-1.5^2;
else 
    S0 = @(x1,x2,x3,x4,x5,x6) -1; 
    Su = @(x1,x2,x3,x4,x5,x6) -1;
    St = @(x1,x2,x3,x4,x5,x6) -1;
    Sd = @(x1,x2,x3,x4,x5,x6) 1;
end