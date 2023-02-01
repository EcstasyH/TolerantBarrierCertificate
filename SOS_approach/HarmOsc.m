function [f, S0, Su, St, Sd, dmin, dmax] = HarmOsc(vars,d)

x = vars(1);
y = vars(2);
f = [x + y , y - x - 7*y + d*y];

%initial set
S0 = 4*(x+2)^2 + 4*y^2 - 1; % <=0
%unsafe set
Su = 100*x^2 + 100*(y-1)^2 - 1; %<=0
%target set
St = 10*x^2 +10*y^2 - 1; %<=0
%domain
Sd = x^2 +y^2 -10; % <=0
dmin = 5;
dmax = 6;
