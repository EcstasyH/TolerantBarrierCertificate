tic

sdpvar x0 x1 u;

%f = [x0+0.01*x0; x1+0.01*(-0.6*x1-x0-x0^3+7+u)];
f = [x0+0.01*(-0.5*x0-0.5*x1+0.5*x0*x1);
     x1+0.01*(-0.5*x1+1+u)];

X = x0^2+x1^2-1;
Xhat = x0^2+x1^2-1.1;
TR = 10*x0^2+10*(x1-0.5)^2;%-1;

y = [x0,x1];

degree = 10;
[V,coe]= polynomial(y,degree);

dw = 10;
[W, coew] = polynomial(y,dw);

V1=replace(V,y,f);
VI = int(V1, (u+5)/10, -5, 5);

W1 = replace(V,y,f);
WI = int(W1, (u+5)/10, -5, 5);

obj = (pi*(7680*coe(1) + 1920*coe(4) + 1920*coe(6) + 960*coe(11) + 320*coe(13) + 960*coe(15) + 600*coe(22) + 120*coe(24) + 120*coe(26) + 600*coe(28) + 420*coe(37) + 60*coe(39) + 36*coe(41) + 60*coe(43) + 420*coe(45) + 315*coe(56) + 35*coe(58) + 15*coe(60) + 15*coe(62) + 35*coe(64) + 315*coe(66)))/7680;

ds = 12;

[s0,coe0]=polynomial(y,ds);
[s1,coe1]=polynomial(y,ds);
[s2,coe2]=polynomial(y,ds);
[s3,coe3]=polynomial(y,ds);
[s4,coe4]=polynomial(y,ds);
[s5,coe5]=polynomial(y,ds);
[s6,coe6]=polynomial(y,ds);

F=[sos(VI - V + s0*X - s1*(TR-1)),...,
    sos(-V + WI - W + s2*X - s3*(TR-1)),...,
    sos(-V + s4*Xhat - s5*X),...,
    sos(1 - V - s6*(1-TR)),...,
    coe>=-100,coe<=100,sos(s0),sos(s1),sos(s2),sos(s3),sos(s4),sos(s5),sos(s6)];

ops = sdpsettings('solver','mosek','verbose',0,'sos.newton',1,'sos.congruence',1);
diagnostics = solvesdp(F,-obj,ops,[coe;coew;coe0;coe1;coe2;coe3;coe4;coe5;coe6])
if diagnostics.problem==0
 disp('Solver thinks it is feasible')
elseif diagnostics.problem==1
 disp('Solver thinks it is infeasible')
else
 disp('Something else happened')
end
v = monolist(y,degree);
sdisplay(v'*double(coe))
toc
