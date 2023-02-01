function Sample_BC2D()

figure (1);
hold on;

% read input
% f: vector field 2D
% S0: init
% Su: unsafe
% Sd: domain
% d: disturbance under uniform distribution [dmin,dmax]
%syms x y d;
%[f, S0, Su, Sd, dmin, dmax] = Ex_BC2D_RLCcircuit(x,y,d);

%{ 
%RLC circuit
r = 0.25;
xc = 0.5;
yc = 1.5;

f1 = @(x,y) 8/9*x-1/18*y+0.01*random('unif',-1,1);
f2 = @(x,y) x+y;
S0 = @(x,y) (x-xc)^2+(y-yc)^2-r^2;
Su = @(x,y) 4-y^2; % <=0
Sd = @(x,y) x^2+y^2-4^2; %<=0
%}
t = 0.1
f1 = @(x,y) x+y*t+ 0.2*random('unif',-1,1)*x*t;
f2 = @(x,y) y+ (-x+1/3*x^3-y)*t;

r = 0.2;
xc = -1;
yc = -0.8;

% init
S0 = @(x,y) (x-xc)^2+(y-yc)^2-r^2; %<= 0
% unsafe
Su = @(x,y) (x+1)^2+(y+1)^2-0.8^2;%  <=0
% domain
Sd = @(x,y) x^2+y^2-2^2; %<=0


f0=fcontour(S0, 'LineColor','g', 'LevelList',[0 0]);
fu=fcontour(Su,  'LineColor','r', 'LevelList',[0 0]);
fd=fcontour(Sd, 'LineColor','b','LevelList',[0 0]);

% Sample Points
sample = 300;

total = 0;
count = 0;
badmax = 0;
for i = [1:sample]
    listx = [random('unif',xc-r ,xc+r)];
    listy = [random('unif',yc-r ,yc+r)];
    if S0(listx,listy) >= 0
        continue
    end
    count2 = 0;
    total = total + 1;
    for t = [1:100]
        curx = f1(listx(t),listy(t));
        cury = f2(listx(t),listy(t));
        listx = [listx curx];
        listy = [listy cury];
        if Su(listx(t),listy(t))<=0
            count = count+1;
            count2 = count2 + 1;
        end
        if badmax< count2
            badmax = count2;
        end
    end
    plot(listx,listy);
end

fprintf("Total: %d \n", total);
fprintf("Count: %d == Badmax: %d\n", count,badmax);
fprintf("Lower bound of gamma:  %f\n", count/total);
