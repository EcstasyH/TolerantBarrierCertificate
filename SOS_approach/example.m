
%figure (1)
%hold on

% plot vector field

%f1 = @(x1,x2) 8/9*x1-1/18*x2+0.004*random('unif',-1,1);
%f2 = @(x1,x2) x2+x1;
    
sdpvar x y d

dMin = 2;
dMax = 8;

display("Finding barrier certificates...");
for deg = [dMin:dMax]
                fprintf("Trying degree %d ...\n",deg);
    
    [sol, p] = ComputeTBC([x y d], deg);
 
    if sol==1
        fprintf("Find a certificate of degree %d: \n", deg);
        sdisplay(p);
        break
    end
    
    if deg == dMax
        fprintf("Cannot find a certificate within the bound.\n");
    end
end



