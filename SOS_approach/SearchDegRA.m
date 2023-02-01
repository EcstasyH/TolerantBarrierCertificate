function SearchDegRA()

for d =[2:15]
    fprintf("Tring deg %d ...", d);
    [~,~]  =ComputeTolerantRA(2, d);   
end

