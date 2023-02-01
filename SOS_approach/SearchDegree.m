function SearchDegree()

% azuma = 0 Markov ineq  =1 AH ineq
azuma = 0; 
% ra = 0 safety =1 reach-avoid
ra = 0;

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
