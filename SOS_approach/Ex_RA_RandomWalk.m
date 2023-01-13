
% Random Walk 1D
bias=0.02;
f = @(x) x + random('unif',-0.5-bias,0.5+bias);
% formulate as a reach-avoid problem
% initial set （initMin,initMax）
initMin = 0.5;
initMax = 1;
% domain set (domainMin, domainMax)
domainMin = -1;
domainMax = 10;
% target set (-INF, targetMax)
targetMax = 0;
% unsafe set (unsafeMin, INF)
unsafeMin = 5;
% tolerant
tolerant = 10;

sampleNum = 300; % num of samples
timeHorizon = 100;

reachCount = 0; % num of finished trials
badCount = 0; % touch unsafe region >= tolerant before hitting
 

figure (1);
hold on;
for i = [1:sampleNum] 
    curx = random('unif',initMin,initMax); 
    listx = [curx];
    count = 0;

    for t = [1:timeHorizon]
        curx =  f(curx);
        listx = [listx curx];
        
        if curx >= unsafeMin
            count = count+1;
            if count > tolerant
                badCount = badCount+1;
                break;
            end
        elseif curx <= targetMax
            reachCount = reachCount+1;
            break
        end
    end
    plot( [1:length(listx)], listx);
end

total = reachCount+badCount;
fprintf("Number of Samples: %d/%d \n", total, sampleNum);
fprintf("Among all finished trials, safe: %d , unsafe %d\n", reachCount, badCount);
fprintf("Predict Gamma Lower Bound: %f\n", badCount/total*(tolerant+1));

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