
figure (1)
hold on

f1 = @(x) x + random('unif',-0.52,0.48);
    
% initial set [0,1]

% domain: (-7, 6]

% unsafe (-infty, -1]
%tolerant 10

% samples
Num = 1000;
reach = 0;
success = 0;
bad = 0;
k=10;
total =0;
 count = 0;
 
for i = [1:Num] 
    flag = 0;
   
    listx = random('unif',0.5,1);
    
    total = total + 1;
    
    for t = [1:1000]
        curx =  f1(listx(t));
        listx = [listx curx];
        
        if curx >=10
            count = count+1;
        end
        
        %if count>=k
          %  bad = bad+1;
          %  break;
        %end
        
        if curx <= 0
            reach = reach +1 ;
            break;
        end
        
    end
 
    plot( [1:length(listx)], listx);

end

fprintf("Total: %d \n", Num);
fprintf("Reach:  %d , Unsafe %d\n", reach, bad);
fprintf("Predict Gamma Lower Bound: %f\n", count/total);
%{
figure(2);
hold on
syms x
s = '-0.0577528134472+0.119229870255*internal(1)-0.0615368768185*internal(1)^2'
v = strrep(s,'internal(1)','x');
%v = strrep(s,'internal(2)','y');
v = eval(v);
fplot(v, [-10 10])

plot([-10 10], [-1 -1],'Color', 'r');
%}