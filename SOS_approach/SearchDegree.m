function SearchDegree(deg)
for i =[2:12]
    fprintf("Tring deg %d ...\n", i);
    %[sol, bc_val]  =ComputeTolerantRA(2,i); 
    [sol, bc_val]  =ComputeTolerantRA(2,i);   
    %if sol == 1
    %    break;
    %end
end