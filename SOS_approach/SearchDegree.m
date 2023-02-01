function SearchDegree()
for i =[2:15]
    fprintf("Tring deg %d ...\n", i);
    %[sol, bc_val]  =ComputeTolerantRA(2,i); 
    [~, ~]  =ComputeTolerantRA(2,i);   
    %if sol == 1
    %    break;
    %end
end