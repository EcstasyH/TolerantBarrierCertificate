function [sol, bc_val] = RA_Brown(deg)

% Ex_BrownMotion

yalmip('clear')
tic

%deg = 2;
sol=0;

% d: random disturbance
sdpvar x d;

[bc , coef_bc] = polynomial(x, deg);

%f1 = @(x1,x2) 0.5*x1-x2*x1;
%f2 = @(x1,x2) (-0.5+random('unif',-0.5,0.5))*x2+x2*x1;
f = x + d;
%f = [x+0.01*(-0.5*x-0.5*y+0.5*x*y), y+0.01*(-0.5*y+1+d)]; 

bf = replace(bc, x, f);

ebf = int(bf, d, -0.52, 0.48);

%initial
S0_1 = -x+0.5;
S0_2 = x-1;
% domain
S_1 = -x-1;
S_2 = x-10;
% target
%St = x-3;
%unsafe
Su_1 = x-10;
Su_2 = 4-x;

degs  = deg+2;

vars = x;
[s1, coef_s1] = polynomial(vars,  degs);
[s2, coef_s2] = polynomial(vars,  degs);
[s3, coef_s3] = polynomial(vars,  degs);
[s4, coef_s4] = polynomial(vars,  degs);
[s5, coef_s5] = polynomial(vars,  degs);
[s6, coef_s6] = polynomial(vars,  degs);
[s7, coef_s7] = polynomial(vars,  degs);
[s8, coef_s8] = polynomial(vars,  degs);
sdpvar gamma_p;
% sos constraints of degree sos_deg 
%{
constraints = [sos( -bc + gamma_p + s1*S0_1+ s2*S0_2),..., %+ s1*S0_1 + s2*S0_2 + s3*S0_3 + s4*S0_4),
                       sos( bc + s3*S_1 + s4*S_2),...,
                       sos( bc - ebf -1 + s5*Su_1 + s9*Su_2),...,
                       sos( bc - ebf+ s6*S_1 + s7*S_2 - s8*St),...,
                       coef_bc>=-100, coef_bc<=100, ...,
                       sos(s1), sos(s2), sos(s3), sos(s4), sos(s5), sos(s6), sos(s7), sos(s8), sos(s9)];
%}
constraints = [sos( -bc + gamma_p + s1*S0_1 + s2*S0_2),..., %+ s1*S0_1 + s2*S0_2 + s3*S0_3 + s4*S0_4),
                       sos(  bc + s3*S_1 + s4*S_2),...,
                       sos(  bc - ebf + s5*S_1 +s6*S_2),...,
                       sos(  bc - ebf - 1 + s7*Su_1 + s8*Su_2),...,
                       coef_bc>=-100, coef_bc<=100, ...,
                       sos(s1), sos(s2), sos(s3),sos(s4),
                       sos(s5), sos(s6), sos(s7), sos(s8)];


%obj = ComputeMoment2D(coef_bc, deg, 1);
%opt = sum(abs(coef_w));
ops = sdpsettings('solver','mosek','verbose',0, 'sos.newton',1,'sos.congruence',1);

diagnostics= solvesdp(constraints, gamma_p ,ops, [gamma_p; coef_bc;coef_s1;coef_s2;
    coef_s3;coef_s4;coef_s5;coef_s6;coef_s7;coef_s8]);

if diagnostics.problem == 0
    disp('A feasible solution is found'); 
    
    coef_bc_val = double(coef_bc);
    mm = monolist(x,deg);
    bc_val = mm' * coef_bc_val;
    disp('bc:'); 
    sdisplay(bc_val);
    disp('gamma:');
    sdisplay(double(gamma_p));
    disp('ebf-bc:');
    
    bf_val = replace(bc_val, x, f);

    ebf_val = int(bf_val, d, -0.52, 0.48);
    sdisplay(ebf_val-bc_val);
    
    sol=1;
else
    disp('No solution is found.');
    bc_val = 0;
end

toc