function [sol, bc_val] = ComputeTolerantBC(dim, deg)
%INPUT:
% dim: system dimension
% deg: degree of tolerant BC template 

tic
yalmip('clear')

sol=0; % =1 if a verified TolerantBC is found
bc_val=0; 

% d: random disturbance
sdpvar d gamma_p;
sdpvar x1 x2 x3 x4 x5 x6;
vars_total = [x1 x2 x3 x4 x5 x6];
vars = vars_total(1:dim);

% read input
% f: vector field
% S0: init
% Su: unsafe
% Sd: domain
% d: disturbance under uniform distribution [dmin,dmax]

%[f, S0, Su, Sd, dmin, dmax] = Ex_BC2D_RLCcircuit(x,y,d);
[f, S0, Su, Sd, dmin, dmax] = Ex_BC2D_Prajna07(vars,d);

[bc , coef_bc] = polynomial(vars, deg);
bcf = replace(bc, vars, f);
ebc = 1/(dmax-dmin)*int(bcf, d, dmin, dmax);

% constraints for TolerantBC
% 1. -B(x)+gamma >= 0 over S0
% 2. B(x) >= 0 over Sd
% 3. B-E(B) >= 0 over Sd (simplified)
% 4. B-E(B)-1 >= 0 over Su
% sdeg: degree of SOS term
sdeg = deg+2; % +2 by default (strange that +2 is better than +4)

[s1, coef_s1] = polynomial(vars, sdeg);
[s2, coef_s2] = polynomial(vars, sdeg);
[s3, coef_s3] = polynomial(vars, sdeg);
[s4, coef_s4] = polynomial(vars, sdeg);

% sos constraints of degree sos_deg 
constraints = [ sos( -bc + gamma_p + s1*S0),...,
                sos(  bc + s2*Sd ),...,
                sos(  bc - ebc + s3*Sd),...,
                sos(  bc - ebc - 1 + s4*Su),...,
                gamma_p>= 1, coef_bc>=-100, coef_bc<=100, ...,
                sos(s1), sos(s2), sos(s3), sos(s4)];

options = sdpsettings('solver','mosek','verbose', 0, 'sos.newton',1,'sos.congruence',1);

diagnostics=  solvesdp(constraints, gamma_p, options, [gamma_p;coef_bc;coef_s1;coef_s2;coef_s3;coef_s4]);

if diagnostics.problem == 0
    sol=1;
    fprintf('A feasible solution is found at degree %d:',deg); 
    
    coef_val = double(coef_bc);
    % if the abolute value of a coefficient is less than 10^-5, 
    % then remove this term
    for i = [1:length(coef_val)]
        if abs(coef_val(i)) <= 1e-5
            coef_val(i)=0;
        end
    end
    v = monolist(vars, deg);
    bc_val = v' * coef_val;
    
    disp('Tolerant BC (unverified):'); 
    sdisplay(bc_val);
    disp('gamma:');
    display(double(gamma_p));
else
    disp('No solution is found.');
    bc_val = 0;
end
toc
return
    