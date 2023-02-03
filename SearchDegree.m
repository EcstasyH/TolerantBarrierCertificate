function SearchDegree()

maxdeg = 12;
azuma = 0;
ra = 1;

if ra == 0
    fprintf("================Safety==================\n");
else
    fprintf("==============Reach-Avoid===============\n");
end

fprintf("===============gamma1=================\n");
tic
for d = 2:maxdeg
    fprintf('\n')
    fprintf("Tring deg %d... ", d);
    [~, ~]  =TolerantBC(d, azuma, ra);   
toc
end
fprintf("=====================================\n");


azuma = 1;
fprintf("===============gamma2=================\n");
tic
for d = 2:maxdeg
    fprintf('\n')
    fprintf("Tring deg %d ...", d);
    [~, ~]  =TolerantBC(d, azuma,ra);   
toc
end
fprintf("=====================================\n");
