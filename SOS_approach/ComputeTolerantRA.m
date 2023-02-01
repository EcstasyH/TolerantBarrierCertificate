function [gamma_sol, sol, bc_val] = ComputeTolerantRA(dim, deg, azuma)
%INPUT:
% dim: system dimension
% deg: degree of tolerant BC template 

%tic
yalmip('clear')

sol=0; % =1 if a verified TolerantRA is found
bc_val=0; 
gamma_sol = 0;

% d: random disturbance
sdpvar d gamma_p;
sdpvar x1 x2 x3 x4 x5 x6;
vars_total = [x1 x2 x3 x4 x5 x6];
vars = vars_total(1:dim);

% read input
% f: vector field 2D
% S0: init
% Su: unsafe
% St: target
% Sd: domain
% d: disturbance under uniform distribution [dmin,dmax]

%[f, S0, Su, St, Sd, dmin, dmax] = Ex_RA_1(x,y,d);
%[f, S0, Su, St, Sd, dmin, dmax] = VandpRA(vars,d);
%[f, S0, Su, St, Sd, dmin, dmax] = HarmOsc(x1,x2,d);
%[f, S0, Su, St, Sd, dmin, dmax] = Ex_RA_LieDeriv(vars,d);
[f, S0, Su, St, Sd, dmin, dmax] = Ex_RA_Prajna07(vars,d);

[bc , coef_bc] = polynomial(vars, deg);
bf = replace(bc, vars, f);
ebf = 1/(dmax-dmin)*int(bf, d, dmin, dmax);

% constraints for TolerantRA
% 1. -B(x)+gamma >= 0 over S0
% 2. B(x) >= 0 over Sd
% 3. B-E(B) >= 0 over S\St (simplified)
% 4. B-E(B)-1 >= 0 over Su
% sdeg: degree of SOS term
sdeg  = deg+4; % +4 by default

[s1, coef_s1] = polynomial(vars, sdeg);
[s2, coef_s2] = polynomial(vars, sdeg);
[s3, coef_s3] = polynomial(vars, sdeg);
[s4, coef_s4] = polynomial(vars, sdeg);
[s5, coef_s5] = polynomial(vars, sdeg);
[s6, coef_s6] = polynomial(vars, sdeg);


if azuma == 0
    constraints = [ sos( -bc + gamma_p + s1*S0),...,
                    sos( bc + s2*Sd),...,
                    sos( bc - ebf + s3*Sd - s4*St - s6*Su),...,
                    sos( bc - ebf -1 + s5*Su),...,
                    coef_bc>=-100, coef_bc<=100, ...,
                    sos(s1), sos(s2), sos(s3), sos(s4), sos(s5),sos(s6)];
else
    constraints = [ sos( -bc + gamma_p + s1*Sd),...,
                    sos( bc + s2*Sd),...,
                    sos( bc - ebf + s3*Sd - s4*St - s6*Su),...,
                    sos( bc - ebf -1 + s5*Su),...,
                    coef_bc>=-100, coef_bc<=100, ...,
                    sos(s1), sos(s2), sos(s3), sos(s4), sos(s5),sos(s6)];
end

options = sdpsettings('solver','mosek','verbose',0, 'sos.newton',1,'sos.congruence',1);
diagnostics= solvesdp(constraints, gamma_p, options, [coef_bc;coef_s1;coef_s2;coef_s3;coef_s4;coef_s5;coef_s6]);

if diagnostics.problem == 0
    sol=1;
    fprintf('A feasible solution is found at degree %d:\n',deg); 
    
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
    
    %disp('Tolerant RA (unverified):');
    %sdisplay(bc_val);
    gamma_sol = double(gamma_p);
    if gamma_sol <= 1 % assume alway greater than 1 
        fprintf("Numerical error detected.\n");
        sol = 0;
    elseif azuma == 0
        fprintf('gamma1: %f\n', gamma_sol);
    elseif azuma == 1
        fprintf('gamma2: %f\n', gamma_sol);        
    end
else
    disp('No solution is found.');
    bc_val = 0;
end
%toc
return