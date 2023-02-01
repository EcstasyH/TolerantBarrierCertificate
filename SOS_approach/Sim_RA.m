figure (2)
hold on

% discrete-time Lotka-Volterra model
%f = [x+0.01*(-0.5*x-0.5*y+0.5*x*y), y+0.01*(-0.5*y+1+d)]; 
f1 = @(x,y) x+0.02*(-2)*y+0.01*random('unif',-1,1);
f2 = @(x,y) y+0.02*(0.8*y+10*(x^2-0.21)*y);

%f1 = @(x1,x2) 0.5*x1-x2*x1;
%f2 = @(x1,x2) (-0.5+random('unif',-0.5,0.5))*x2+x2*x1;
 
% initial
viscircles([0.7,0.1], 0.1,'Color','g')
% target set
viscircles([0,0], 0.1,'Color','g')
% domain 
viscircles([0,0], 1,'Color','g')
% unsafe: out  of domain


syms x0 x1
v =0.0196308550716+0.294006820347*internal(1)+0.0238717608551*y+2.67521355268*internal(1)^2-0.0078531845904*internal(1)*y+0.123835212332*y^2+0.707296320202*internal(1)^3+0.181488587648*internal(1)^2*y+0.078261586244*internal(1)*y^2+0.00927469413132*y^3;

fc2 = fcontour(v, 'r');
fc2.LevelList = [0.25];

fc2 = fcontour(v, 'm');
fc2.LevelList = [0.5];

fc2 = fcontour(v, 'blue');
fc2.LevelList = [0.75];
%viscircles([0,0], 0.5,'Color','k')
%}

% samples

total = 0;
unsafe = 0;
for i = [1:200] 
    listx = [random('unif',0.4,0.6)];
    listy = [random('unif',0,0.2)];
    if (listx-0.5)^2+(listy-0.1)^2>1
        continue
    end
    total = total + 1;
    count = 0;
    for t = [1:300]
        curx =  f1(listx(t),listy(t));
        listx = [listx curx];
        cury = f2(listx(t),listy(t));
        listy = [listy cury];
        %if curx^2+cury^2<=0.01
        %    break;
        %end  
        if curx^2+cury^2>= 1
            count = count+1;
        end
    end
    plot(listx,listy);
    if count > 5
        unsafe = unsafe +1;
    end
end

fprintf("Total: %d \n", total);
fprintf("Unsafe:  %d , percentage %f\n",unsafe, unsafe/total);
