function SearchDegree()

dim = 2;
azuma = 1
fprintf("=====================================\n");
for d =[2:12]
    fprintf("Tring deg %d ...", d);
    [sol, bc_val]  =ComputeTolerantBC(dim, d, azuma);   
end
fprintf("=====================================\n");