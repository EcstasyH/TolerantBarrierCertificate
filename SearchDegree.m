function SearchDegree()

% maxdeg: search range, set 16,12,10,6 for system with dimension 1,2,3,4
% ra: =0 safety =1 reach-avoid
maxdeg = 18;
ra = 0; 


if ra == 0
    fprintf("================Safety==================\n");
else
    fprintf("==============Reach-Avoid===============\n");
end


azuma = 0;
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
