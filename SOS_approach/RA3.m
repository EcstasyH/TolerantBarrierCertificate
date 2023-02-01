function [f, S0, Su, St, Sd, dmin, dmax] = RA3(x,y,d)

f = [y , -x - 7*y + d*y];

%initial set
S0 = 4*(x+2)^2 + 4*y^2 - 1; % <=0
%unsafe set
Su = 4*x^2 + 4*(y-1)^2 - 1; %<=0
%target set
St = 10*x^2 +10*y^2 - 1; %<=0
%domain
Sd = x^2 +y^2 -10; % <=0
dmin = 5;
dmax = 6;