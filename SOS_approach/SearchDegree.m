function SearchDegree()

dim = 4;
azuma = 0;

fprintf("===============gamma1=================\n");

for d =[2:12]
    fprintf("Tring deg %d... ", d);
    [gamma1, sol, bc_val]  =ComputeTolerantBC(dim, d, azuma);   
end
fprintf("=====================================\n");


azuma = 1;
fprintf("===============gamma2=================\n");
for d =[2:12]
    fprintf("Tring deg %d ...", d);
    [gamma2, sol, bc_val]  =ComputeTolerantBC(dim, d, azuma);   
end
fprintf("=====================================\n");
