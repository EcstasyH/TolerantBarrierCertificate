function Sim_BC()
plot_flag = 0;

% system dynamic
  
xc = 0.25;
r = 0.25;

bias = -0.2;

f = @(x,y) x+0.4*(random('unif',-1,1)+bias);

S0 = @(x) (x-xc)^2-r^2;
Su = @(x) 0.5-x;%(x-1.5)^2-2.5^2;
Sd = @(x) (x-0)^2-2^2;



if plot_flag == 1
    figure (1);
    hold on;

    f0=fcontour(S0, 'LineColor','g', 'LevelList',[0 0]);
    fu=fcontour(Su, 'LineColor','r', 'LevelList',[0 0]);
    fd=fcontour(Sd, 'LineColor','b','LevelList',[0 0]);
end

%{
% Sample2D
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
%}

% Sample1D
sample = 300;

total = 0;
count = 0;
badmax = 0;
for i = [1:sample]
    listx = [random('unif',xc-r ,xc+r)];
    total = total + 1;
    
    count2 = 0;
    for t = [1:100]
        curx = f(listx(t));
        listx = [listx curx];
        if Su(listx(t))<=0
            count = count+1;
            count2 = count2 + 1;
        end
        if badmax< count2
            badmax = count2;
        end
        if Sd(listx(t))>=0
            break
        end
    end

    if plot_flag == 1
        plot(listx);
    end    
end

fprintf("Total: %d \n", total);
fprintf("Count: %d == Badmax: %d\n", count,badmax);
fprintf("Lower bound of gamma:  %f\n", count/total);