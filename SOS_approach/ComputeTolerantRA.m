function [sol, bc_val] = ComputeTolerantRA(deg)
%tolerant

yalmip('clear')
tic
sol=0;
% d: random disturbance
sdpvar x y d;
%deg = 14;

degs  = deg+2;

[bc , coef_bc] = polynomial([x y], deg);

%f1 = @(x1,x2) 0.5*x1-x2*x1;
%f2 = @(x1,x2) (-0.5+random('unif',-0.5,0.5))*x2+x2*x1;
f = [0.5*x-x*y, x*y-0.5*y+d*y];
%f = [x+0.01*(-0.5*x-0.5*y+0.5*x*y), y+0.01*(-0.5*y+1+d)]; 

bf = replace(bc, [x y], f);

ebf = int(bf, d, -0.5, 0.5);

%initial
S0 = x^2+y^2-0.9^2;
% domain
S = x^2+y^2-1;
% target
St = 100*x^2+100*y^2-1;
%unsafe
Su = -S;

[s1, coef_s1] = polynomial([x y],  degs);
[s2, coef_s2] = polynomial([x y],  degs);
[s3, coef_s3] = polynomial([x y],  degs);
[s4, coef_s4] = polynomial([x y],  degs);
[s5, coef_s5] = polynomial([x y],  degs);

gamma_p = 1.9;
% sos constraints of degree sos_deg 
constraints = [sos( -bc + gamma_p + s1*S0),..., %+ s1*S0_1 + s2*S0_2 + s3*S0_3 + s4*S0_4),
                       sos( bc + s2*S),...,
                       sos( bc - ebf -1 + s3*Su),...,
                       sos( bc - ebf+ s4*S - s5*St),...,
                       coef_bc>=-100, coef_bc<=100, ...,
                       sos(s1), sos(s2), sos(s3), sos(s4), sos(s5)];

obj = ComputeMoment2D(coef_bc, deg, 1);
%opt = sum(abs(coef_w));
ops = sdpsettings('solver','mosek','verbose',0, 'sos.newton',1,'sos.congruence',1);

diagnostics= solvesdp(constraints, -obj,ops, [coef_bc;coef_s1;coef_s2;
    coef_s3;coef_s4;coef_s5]);

if diagnostics.problem == 0
    disp('A feasible solution is found'); 
    
    coef_bc_val = double(coef_bc);
    mm = monolist([x y], deg);
    bc_val = mm' * coef_bc_val;
    disp('bc:'); 
    sdisplay(bc_val);
    sol=1;
else
    disp('No solution is found.');
    bc_val = 0;
end

toc