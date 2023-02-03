function  [dim,f1,f2,f3,f4,f5,f6,S0,Su,St,Sd] = Ex2d_Vandp(vars,ra)
    
    
dim = 2;

x1 = vars(1);
x2 = vars(2);
x3 = vars(3);
x4 = vars(4); 
x5 = vars(5);
x6 = vars(6);
d  = vars(7);

t = 0.1;
<<<<<<< HEAD
 
=======

>>>>>>> 1781421 (van)
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
    
