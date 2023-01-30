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

r = 0.01;
xc = 0.25;
yc = 1;

f1 = @(x,y) 8/9*x-1/18*y+0.05*random('unif',-1,1);
f2 = @(x,y) x+y;
S0 = @(x,y) (x-xc)^2+(y-yc)^2-r^2;
Su = @(x,y) 4-y^2; % <=0
Sd = @(x,y) x^2+y^2-4^2; %<=0

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
        if cury>= 2 || cury<=-2 
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
