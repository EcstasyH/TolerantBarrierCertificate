function [sol, bc_val] = ComputeTolerantBC2D(deg)
tic

yalmip('clear')

sol=0; % =1 if a verified TolerantBC is found
bc_val=0; 

% d: random disturbance
sdpvar x y d
% read input
[f, S0, Su, Sd] = Ex_RLCcircuit2D(x,y,d);
% sdeg: degree of SOS term
sdeg = deg+4;

v = monolist([x y], deg);


[bc , coef_bc] = polynomial([x y], deg);
%f = [8/9*x-1/18*y+0.01*d, y+x];
bcf = replace(bc, [x y], f);
ebc = 1/2*int(bcf, d, -1, 1);



% initial
%S0_1 = -x;
%S0_2 = x-0.5;
%S0_3 = y-1;
%S0_4 = -y;
%S0 = (x-0.25)^2+(y-1)^2 -0.25^2;
% unsafe
%Su_1 = 2-y;
%Su_2 = y+2;
% domain
%S = x^2+y^2-4^2;

% k =5 prob 0.9 
sdpvar gamma_p ;
%[p,gamma] = polynomial(vars, 0)

% constraints for convex bc
% 1. -B(x)+gamma >= 0 over S0
% 2. B(x)  >= 0 over S
% 3. B- EB - 1 >= 0 over Su
% 4. B - EB >= 0 over S\Su

vars = [x y];
[s1, coef_s1] = polynomial(vars,  sdeg);
[s2, coef_s2] = polynomial(vars, sdeg);
[s3, coef_s3] = polynomial(vars, sdeg);
[s4, coef_s4] = polynomial(vars, sdeg);
[s5, coef_s5] = polynomial(vars, sdeg);

% sos constraints of degree sos_deg 
constraints = [ sos( -bc + gamma_p + s1*S0),...,
                sos(  bc + s2*Sd ),...,
                sos(  bc - ebc + s3*Sd),...,
                sos(  bc - ebc - 1 + s4*Su + s5*Sd),...,
                coef_bc>=-100, coef_bc<=100, ...,
                sos(s1), sos(s2), sos(s3), sos(s4), sos(s5)];
options = sdpsettings('solver','mosek','verbose', 0, 'sos.newton',1,'sos.congruence',1);

diagnostics=  solvesdp(constraints, gamma_p, options, [gamma_p;coef_bc;coef_s1;coef_s2;coef_s3;coef_s4;coef_s5]);

if diagnostics.problem == 0
    disp('A feasible solution is found'); 
    sol =1;
    coef_val = double(coef_bc);
    disp('BC:'); 
    bc_val = v' * coef_val;
    sdisplay(bc_val);
    disp('gamma:');
    display(double(gamma_p));
    bcf_val = replace(bc_val, [x y], f);
    ebc_val = 1/2*int(bcf_val, d, -1, 1);
    sdisplay(ebc_val-bc_val);
    
else
    disp('Something else happened');
    bc_val = 0;
end

toc;
return
