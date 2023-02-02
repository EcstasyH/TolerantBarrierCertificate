function SearchDegree()

maxdeg = 12;
azuma = 0;
ra = 0;

if ra == 0
    fprintf("================Safety==================\n");
else
    fprintf("==============Reach-Avoid=============\n");
end

azuma = 1;
fprintf("===============gamma2=================\n");
for d = 2:maxdeg
    fprintf("Tring deg %d ...", d);
    [~, ~]  =TolerantBC(d, azuma,ra);   
end
fprintf("=====================================\n");
