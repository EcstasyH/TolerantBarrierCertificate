function Sample_BC2D(sample)

figure (1);
hold on;

% read input
% f: vector field 2D
% S0: init
% Su: unsafe
% Sd: domain
% d: disturbance under uniform distribution [dmin,dmax]
syms x y d;
[f, S0, Su, Sd, dmin, dmax] = Ex_BC_RLCcircuit2D(x,y,d);

f0=fcontour(S0,'LineColor','g','LevelList',[0 0])
fu=fcontour(Su,'LineColor','r','LevelList',[0 0])
fd=fcontour(Sd,'LineColor','b','LevelList',[0 0])
    