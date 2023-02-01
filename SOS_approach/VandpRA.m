function [f, S0, Su, St, Sd, dmin, dmax] = VandpRA(x,y,d)

f = [x - 0.1*d*y , y + 0.08*x + 0.5*(x^2-0.2)*y];

%initial set
S0 = 100*(x-0.3)^2 + 100*y^2 - 1; % <=0
%unsafe set
Su = 1000*(x+0.3)^2 + 1000*y^2 - 1; %<=0
%target set
St = 10*x^2 +10*y^2 - 1; %<=0
%domain
Sd = x^2 +y^2 -1; % <=0
dmin = 1;
dmax = 3;

