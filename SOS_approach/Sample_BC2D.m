function Sample_BC2D(sample)

figure (1);
hold on;

% read input
% f: vector field 2D
% S0: init
% Su: unsafe
% Sd: domain
% d: disturbance under uniform distribution [dmin,dmax]
syms x y d;
[f, S0, Su, Sd, dmin, dmax] = Ex_BC_RLCcircuit2D(x,y,d);

f0=fcontour(S0,'LineColor','g','LevelList',[0 0])
fu=fcontour(Su,'LineColor','r','LevelList',[0 0])
fd=fcontour(Sd,'LineColor','b','LevelList',[0 0])

% Sample Points
if sample = 0
    return;
total = 0;
unsafe = 0;
for i = [1:200] 
    listx = [random('unif',0 ,0.5)];
    listy = [random('unif',0.75 ,1.25)];
    if subs(S0, [x y], [listx listy]<0)
        continue
    end
    total = total + 1;
    count = 0;
    for t = [1:100]
        curx =  f1(listx(t),listy(t));
        listx = [listx curx];
        cury = f2(listx(t),listy(t));
        listy = [listy cury];
        if cury>= 2 || cury<=-2
            count = count+1;
        end
    end
    plot(listx,listy);
    if count > 10
        unsafe = unsafe +1;
    end
end

fprintf("Total: %d \n", total);
fprintf("Unsafe:  %d , percentage %f\n",unsafe, unsafe/total);