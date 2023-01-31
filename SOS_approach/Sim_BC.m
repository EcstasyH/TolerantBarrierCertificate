function Sim_BC()
plot_flag = 1;

% system dynamic
  
r = 0.1;
xc = 0;
yc = -0.5;

t = 0.1;
f1 = @(x,y) x+(-2*y)*t;
f2 = @(x,y) y+x^2*t+0.1*random('unif',-1,1)*x;

S0 = @(x,y) (x-xc)^2+(y-yc)^2-r^2;
Su = @(x,y) (x-0.5)^2+(y-0.75)^2-0.4^2;
Sd = @(x,y) x^2+y^2-1.5^2;


if plot_flag == 1
    figure (1);
    hold on;

    f0=fcontour(S0, 'LineColor','g', 'LevelList',[0 0]);
    fu=fcontour(Su, 'LineColor','r', 'LevelList',[0 0]);
    fd=fcontour(Sd, 'LineColor','b','LevelList',[0 0]);
end

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
    total = total + 1;
    count2 = 0;
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
        if Sd(listx(t),listy(t))>=0
            break
        end
    end

    if plot_flag == 1
        plot(listx,listy);
    end    
end

fprintf("Total: %d \n", total);
fprintf("Count: %d == Badmax: %d\n", count,badmax);
fprintf("Lower bound of gamma:  %f\n", count/total);