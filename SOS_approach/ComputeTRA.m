function [sol, bc_val] = ComputeTRA(deg)

yalmip('clear')
tic
sol=0;
bc_val=0;
% d: random disturbance
sdpvar x y d;

degv  = deg;
degw = deg;
degs  = deg+2;

[v , coef_v] = polynomial([x y], degv);
[w, coef_w] = polynomial([x y], degw);

%f1 = @(x1,x2) 0.5*x1-x2*x1;
%f2 = @(x1,x2) (-0.5+random('unif',-0.5,0.5))*x2+x2*x1;
%f = [0.5*x-x*y, x*y-0.5*y+d*y];
f = [x+0.01*(-0.5*x-0.5*y+0.5*x*y), y+0.01*(-0.5*y+1+d)]; 

vf = replace(v, [x y], f);
wf = replace(w, [x y], f);

%evf = int(vf, d, -0.5, 0.5);
%ewf = int(wf, d, -0.5, 0.5);
evf = int(vf, (d+5)/10, -5, 5);
ewf = int(wf, (d+5)/10, -5, 5);

% domain
X = x^2+y^2-1;
% target
T = 10*x^2+10*(y-0.5)^2-1;
% X_bar
Xb = x^2+y^2- 1.1;

[s1, coef_s1] = polynomial([x y],  degs);
[s2, coef_s2] = polynomial([x y],  degs);
[s3, coef_s3] = polynomial([x y],  degs);
[s4, coef_s4] = polynomial([x y],  degs);
[s5, coef_s5] = polynomial([x y],  degs);
[s6, coef_s6] = polynomial([x y],  degs);
[s7, coef_s7] = polynomial([x y],  degs);

% sos constraints of degree sos_deg 
constraints = [sos( evf-v+s1*X-s2*T),..., %+ s1*S0_1 + s2*S0_2 + s3*S0_3 + s4*S0_4),
                       sos( -v + ewf - w + s3*X-s4*T),...,
                       sos( -v+s5*Xb-s6*X),...,
                       sos(1-v+s7*T),...,
                       coef_v>=-100, coef_v<=100, ...,
                       sos(s1), sos(s2), sos(s3), sos(s4), sos(s5), sos(s6), sos(s7)];

                   
obj = ComputeMoment2D(coef_v, degv, 1);
%opt = sum(abs(coef_w));
ops = sdpsettings('solver','mosek','verbose',0, 'sos.newton',1,'sos.congruence',1);

diagnostics= solvesdp(constraints, -obj,ops, [coef_v;coef_w;coef_s1;coef_s2;
    coef_s3;coef_s4;coef_s5;coef_s6;coef_s7]);

if diagnostics.problem == 0
    disp('A feasible solution is found'); 
    
    coef_v_val = double(coef_v);
    mv = monolist([x y], degv);
    v_val = mv' * coef_v_val;
    disp('v:'); 
    sdisplay(v_val);
    sol=1;
    %{
    coef_w_val = double(coef_w);
    mw = monolist([x y], degw);
    w_val = mw' * coef_w_val;
    disp('w:'); 
    sdisplay(w_val);
    %}
else
    disp('No solution is found.');
    bc_val = 0;
end

toc