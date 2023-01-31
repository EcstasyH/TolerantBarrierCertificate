function SearchDegree(deg)
for i =[2:10]
    fprintf("Tring deg %d ...\n", i);
    %[sol, bc_val]  =ComputeTolerantBC2D(i); 
    [sol, bc_val]  =ComputeTolerantBC2D(i);   
    %if sol == 1
    %    break;
    %end
end