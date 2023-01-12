function [sol, bc_val] = ComputeTolerantRA2D(deg)

tic

yalmip('clear')

sol=0; % =1 if a verified TolerantRA is found
bc_val=0; 

% d: random disturbance
sdpvar x y d;
sdpvar gamma_p;

% read input
% f: vector field 2D
% S0: init
% Su: unsafe
% St: target
% Sd: domain
% d: disturbance under uniform distribution [dmin,dmax]
[f, S0, Su, St, Sd, dmin, dmax] = RA_Ex_1(x,y,d);

[bc , coef_bc] = polynomial([x y], deg);
bf = replace(bc, [x y], f);
ebf = 1/(dmax-dmin)*int(bf, d, dmin, dmax);

% constraints for TolerantRA
% 1. -B(x)+gamma >= 0 over S0
% 2. B(x) >= 0 over Sd
% 4. B-E(B) >= 0 over S\St
% 3. B-E(B)-1 >= 0 over Su
% sdeg: degree of SOS term
sdeg  = deg+4;

[s1, coef_s1] = polynomial([x y], sdeg);
[s2, coef_s2] = polynomial([x y], sdeg);
[s3, coef_s3] = polynomial([x y], sdeg);
[s4, coef_s4] = polynomial([x y], sdeg);
[s5, coef_s5] = polynomial([x y], sdeg);

% sos constraints of degree sos_deg 
constraints = [ sos( -bc + gamma_p + s1*S0),..., %+ s1*S0_1 + s2*S0_2 + s3*S0_3 + s4*S0_4),
                sos( bc + s2*Sd),...,
                sos( bc - ebf + s3*Sd - s4*St),...,
                sos( bc - ebf -1 + s5*Su),...,
                coef_bc>=-100, coef_bc<=100, ...,
                sos(s1), sos(s2), sos(s3), sos(s4), sos(s5)];

% obj = ComputeMoment2D(coef_bc, deg, 1);
options = sdpsettings('solver','mosek','verbose',0, 'sos.newton',1,'sos.congruence',1);

diagnostics= solvesdp(constraints, gamma_p, options, [coef_bc;coef_s1;coef_s2;coef_s3;coef_s4;coef_s5]);

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
    v = monolist([x y], deg);
    bc_val = v' * coef_val;
    disp('Tolerant RA (unverified):');
    sdisplay(bc_val);
    disp('gamma:');
    sdisplay(double(gamma_p));
else
    disp('No solution is found.');
    bc_val = 0;
end
toc
return