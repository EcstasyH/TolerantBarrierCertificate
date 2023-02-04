function Sim_BC()
plot_flag = 1;

% system dynamic
  
t=0.1;
f1 = @(x1,x2) x1 - t*2*x2;
f2 = @(x1,x2) x2 + t*(0.8*x1+10*x1^2*x2-(2+random('unif',-1,1))*x2);


xc = 0.5;
yc = 0.5;
r = 0.1;

S0 = @(x1,x2) (x1-xc)^2+(x2-yc)^2-r^2;
Su = @(x1,x2) (x1+0.25)^2+x2^2-0.1^2;
St = @(x1,x2) x1^2+x2^2-0.1^2;
Sd = @(x1,x2) x1^2+x2^2-1;

if plot_flag == 1
    figure(1);
    hold on;
    f0=fcontour(S0, 'LineColor','g', 'LevelList',[0 0]);
    fu=fcontour(Su,  'LineColor','r', 'LevelList',[0 0]);
    ft=fcontour(St,  'LineColor','r', 'LevelList',[0 0]);
    fd=fcontour(Sd, 'LineColor','b','LevelList',[0 0]);
end

% Sample2D
sample = 300;

total = 0;
count = 0;
for i = [1:sample]
    listx = [random('unif',xc-r ,xc+r)];
    listy = [random('unif',yc-r ,yc+r)];
    if S0(listx(1),listy(1)) >= 0
        continue
    end
    total = total + 1;
    for t = [1:100]
        curx = f1(listx(t),listy(t));
        cury = f2(listx(t),listy(t));
        listx = [listx curx];
        listy = [listy cury];
        if Su(listx(t),listy(t))<=0
            count = count+1;
        end
        if Sd(listx(t), listy(t))>=0
            break
        end
    end
    if plot_flag == 1
        plot(listx,listy);
    end
end


%{
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
%}

fprintf("Total: %d \n", total);
fprintf("Average visiting time:  %f\n", count/total);
if plot_flag == 1
    hold off;
end