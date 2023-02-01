function SearchDegree()

dim = 4;
azuma = 0;
ra = 1;

if ra == 0
    fprintf("================Safety================\n");
else
    fprintf("==============Reach-Avoid=============\n");
end

fprintf("===============gamma1=================\n");
for d =[2:12]
    fprintf("Tring deg %d... ", d);
    [sol, gamma1]  =TolerantBC(d, azuma, ra);   
end
fprintf("=====================================\n");


azuma = 1;
fprintf("===============gamma2=================\n");
for d =[2:12]
    fprintf("Tring deg %d ...", d);
    [sol, gamma2]  =TolerantBC(d, azuma,ra);   
end
fprintf("=====================================\n");
