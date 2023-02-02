function Sim_BC()
plot_flag = 0;

% system dynamic
  
t = 0.1;
f1 = @(x1,x2,x3,x4) x1 + (-x1*random('unif',-1,1)+x2^3-2*x3*x4)*t;
f2 = @(x1,x2,x3,x4) x2 + (-x1*random('unif',-1,1)-x2^3)*t;
f3 = @(x1,x2,x3,x4) x3 + (x1*x4-x3*random('unif',-1,1))*t;
f4 = @(x1,x2,x3,x4) x4 + (x1*x3-x4^3)*t;

x1c = 0.5;
x2c = 0.5;
x3c = 0;
x4c = 0;
r = 0.2;
% init   <=0
S0 = @(x1,x2,x3,x4) (x1-0.5)^2+(x2-0.5)^2+(x3-0)^2+(x4-0)^2-r^2; 
% unsafe <=0
Su = @(x1,x2,x3,x4) (x1-0.25)^2+(x2-0.25)^2+(x3-0)^2+(x4-0)^2-0.1^2;  
% domain <=0
Sd = @(x1,x2,x3,x4) x1^2+x2^2+x3^2+x4^2-1^2; 


sample =500;

total = 0;
count = 0;
for i = [1:sample]
    listx1 = [random('unif',x1c-r ,x1c+r)];
    listx2 = [random('unif',x2c-r ,x2c+r)];
    listx3 = [random('unif',x3c-r ,x3c+r)];
    listx4 = [random('unif',x4c-r ,x4c+r)];
    if S0(listx1(1),listx2(1),listx3(1),listx4(1)) >= 0
        continue
    end
    total = total + 1;
    for t = [1:100]
        curx1 = f1(listx1(t),listx2(t),listx3(t),listx4(t));
        curx2 = f2(listx1(t),listx2(t),listx3(t),listx4(t));
        curx3 = f3(listx1(t),listx2(t),listx3(t),listx4(t));
        curx4 = f4(listx1(t),listx2(t),listx3(t),listx4(t));
        listx1 = [listx1 curx1];
        listx2 = [listx2 curx1];
        listx3 = [listx3 curx1];
        listx4 = [listx4 curx1];
        if Su(listx1(t),listx2(t),listx3(t),listx4(t))<=0
            count = count+1;
        end
        if Sd(listx1(t),listx2(t),listx3(t),listx4(t))>=0
            break
        end
    end
end

if plot_flag == 1
    figure(1);
    hold on;
    f0=fcontour(S0, 'LineColor','g', 'LevelList',[0 0]);
    fu=fcontour(Su,  'LineColor','r', 'LevelList',[0 0]);
    fd=fcontour(Sd, 'LineColor','b','LevelList',[0 0]);
end

% Sample2D
%{
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
%}

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