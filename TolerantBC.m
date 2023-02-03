function [sol, gamma] = TolerantBC(deg, azuma, ra)
% INPUT
%   deg: degree of tolerant BC template 
%   azuma:  = 0 use condition for Markov inequality
%           = 1 use condition for Azuma-Hoeffding inequality
%   ra:     = 0 tolerant safety problem
%           = 1 tolerant reachavoid problem
% OUTPUT
%   sol:    = 0 fail to find a solution
%           = 1 a solution is found
%   gamma: value of gamma


% INITIATION
yalmip('clear')
sol=0;
gamma = 0;


% SYSTEM DYNAMIC
%
% dim: system dimension  <= 6
% f  : vector field
% S0 : init
% Su : unsafe
% St : target
% Sd : domain 
% d  : disturbance under uniform distribution [-1,1]
sdpvar gamma_p;
sdpvar x1 x2 x3 x4 x5 x6 d;
vars_total = [x1,x2,x3,x4,x5,x6,d];

[dim,f1,f2,f3,f4,f5,f6,S0_f,Su_f,St_f,Sd_f] = Ex4d_CWH(vars_total,ra);


f_total = [f1,f2,f3,f4,f5,f6];
S0 = S0_f(x1,x2,x3,x4,x5,x6);
Su = Su_f(x1,x2,x3,x4,x5,x6);
St = St_f(x1,x2,x3,x4,x5,x6);
Sd = Sd_f(x1,x2,x3,x4,x5,x6);

vars = vars_total(1:dim);
f = f_total(1:dim);

[bc, coef_bc] = polynomial(vars, deg);
bcf = replace(bc, vars, f);
ebf = 1/2*int(bcf, d, -1, 1);


% ENCODING CONSTRINTS FOR BARRIER CERTIFICATE  
%
% Tolerant safety
% 1. -B(x)+gamma >= 0 over S0
% 2. B(x) >= 0 over Sd
% 3. B-E(B) >= 0 over Sd\Su
% 4. B-E(B)-1 >= 0 over Su
%
% Tolerant reach-avoid
% 1. -B(x)+gamma >= 0 over S0
% 2. B(x) >= 0 over Sd
% 3. B-E(B) >= 0 over S\(St U Su)
% 4. B-E(B)-1 >= 0 over Su

% sdeg: degree of SOS term, +4 by default
sdeg = deg+4; 

[s1, coef_s1] = polynomial(vars, sdeg);
[s2, coef_s2] = polynomial(vars, sdeg);
[s3, coef_s3] = polynomial(vars, sdeg);
[s4, coef_s4] = polynomial(vars, sdeg);
[s5, coef_s5] = polynomial(vars, sdeg);
[s6, coef_s6] = polynomial(vars, sdeg);

if ra == 0
    if azuma == 0
        constraints = [ sos( -bc + gamma_p + s1*S0),...,
                        sos(  bc + s2*Sd ),...,
                        sos(  bc - ebf + s3*Sd - s5*Su),...,
                        sos(  bc - ebf - 1 + s4*Su),...,
                        coef_bc>=-100, coef_bc<=100, ...,
                        sos(s1), sos(s2), sos(s3), sos(s4), sos(s5)];
    else 
        constraints = [ sos( -bc + gamma_p + s1*Sd),...,
                        sos(  bc + s2*Sd ),...,
                        sos(  bc - ebf + s3*Sd - s5*Su),...,
                        sos(  bc - ebf - 1 + s4*Su),...,
                        coef_bc>=-100, coef_bc<=100, ...,
                        sos(s1), sos(s2), sos(s3), sos(s4), sos(s5)];
    end
    options = sdpsettings('solver','mosek','verbose', 0, 'sos.newton',1,'sos.congruence',1);
    diagnostics=  solvesdp(constraints, gamma_p, options, [gamma_p;coef_bc;coef_s1;coef_s2;coef_s3;coef_s4;coef_s5]);   
else
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
end

if diagnostics.problem == 0
    sol=1;
    fprintf('A feasible solution is found:\n'); 
    gamma = double(gamma_p);
    if azuma == 0
        fprintf('gamma1: %f\n', gamma);
    else
        fprintf('gamma2: %f\n', gamma);        
    end
    if gamma <= 0.1
        fprintf('Warning: there may be numerical errors.\n')
    end
    %{
    % construct B(x)
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
    %}
else
    disp('No solution is found.');
    bc_val = 0;
end

return
        