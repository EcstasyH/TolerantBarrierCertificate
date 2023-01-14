function Plot2D(sample)

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
    
%{
syms x y
s = '0.00244730907255-0.0665811632785*internal(1)+0.613467076354*internal(1)^2-1.86283253462*internal(1)^3+1.75636552469*internal(1)^4+0.838677471735*internal(1)^5-1.66179443944*internal(1)^6-0.176206153539*internal(1)^7+0.501837430523*internal(1)^8+0.0876828106449*internal(1)^9-0.0270341008909*internal(1)^10-0.00378551931696*internal(1)^11+0.000215825221517*internal(1)^12'
%v = strrep(s,'internal(1)','x');
v = strrep(s,'internal(2)','y');
v = eval(v);
fc = fcontour(v, 'r');
fc.LevelList = [0];

fc = fcontour(v, 'm');
fc.LevelList = [-1];
%}