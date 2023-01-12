function Sample_BC2D(sample)

figure (1);
hold on;

% read input
% f: vector field 2D
% S0: init
% Su: unsafe
% Sd: domain
% d: disturbance under uniform distribution [dmin,dmax]
syms x y d;
[f, S0, Su, Sd, dmin, dmax] = Ex_BC_RLCcircuit2D(x,y,d);

f0=fcontour(S0,'LineColor','g','LevelList',[0 0])
fu=fcontour(Su,'LineColor','r','LevelList',[0 0])
fd=fcontour(Sd,'LineColor','b','LevelList',[0 0])

% Sample Points
if sample = 0
    return;
total = 0;
unsafe = 0;
for i = [1:200] 
    listx = [random('unif',0 ,0.5)];
    listy = [random('unif',0.75 ,1.25)];
    if subs(S0, [x y], [listx listy]<0)
        continue
    end
    total = total + 1;
    count = 0;
    for t = [1:100]
        curx =  f1(listx(t),listy(t));
        listx = [listx curx];
        cury = f2(listx(t),listy(t));
        listy = [listy cury];
        if cury>= 2 || cury<=-2
            count = count+1;
        end
    end
    plot(listx,listy);
    if count > 10
        unsafe = unsafe +1;
    end
end

fprintf("Total: %d \n", total);
fprintf("Unsafe:  %d , percentage %f\n",unsafe, unsafe/total);


%1.00863027589+0.000764336887414*internal(1)-0.000238717762073*y-0.468983167011*internal(1)^2-0.0569691197657*internal(1)*y-0.0548913723523*y^2-0.0144508742475*internal(1)^3+0.00036810202576*internal(1)^2*y-0.00218128820727*internal(1)*y^2+0.000110151003611*y^3-1.32189812228*internal(1)^4-0.0276426938784*internal(1)^3*y-0.210466867904*internal(1)^2*y^2-0.010469089574*internal(1)*y^3-0.0100260863621*y^4-0.0316098166426*internal(1)^5-0.0227690667434*internal(1)^4*y-0.0120809898503*internal(1)^3*y^2-0.00481557415603*internal(1)^2*y^3-0.00108282817119*internal(1)*y^4-0.000224078893439*y^5+7.02002022834*internal(1)^6+0.0324912194204*internal(1)^5*y+1.66388571055*internal(1)^4*y^2+0.114240580765*internal(1)^3*y^3+0.178029061833*internal(1)^2*y^4+0.00712115843463*internal(1)*y^5+0.0055013541901*y^6+0.148581135528*internal(1)^7+0.0727409006165*internal(1)^6*y+0.0692171204619*internal(1)^5*y^2+0.0225874790207*internal(1)^4*y^3+0.0103416507113*internal(1)^3*y^4+0.0020005985662*internal(1)^2*y^5+0.000528187358512*internal(1)*y^6+6.06896049504e-05*y^7-17.4750613071*internal(1)^8-0.538926185308*internal(1)^7*y-5.84689069156*internal(1)^6*y^2-0.53511669379*internal(1)^5*y^3-0.978034114377*internal(1)^4*y^4-0.0681363421299*internal(1)^3*y^5-0.0696277204549*internal(1)^2*y^6-0.00168279424344*internal(1)*y^7-0.00153810349009*y^8-0.108957907605*internal(1)^9-0.0543836313277*internal(1)^8*y-0.0644425744538*internal(1)^7*y^2-0.0227171921388*internal(1)^6*y^3-0.0135755923817*internal(1)^5*y^4-0.00325546995271*internal(1)^4*y^5-0.0013116970926*internal(1)^3*y^6-0.000153877097446*internal(1)^2*y^7-4.80287843203e-05*internal(1)*y^8-3.96210754161e-06*y^9+12.7752460312*internal(1)^10+0.188916345594*internal(1)^9*y+5.26617176403*internal(1)^8*y^2+0.404154303285*internal(1)^7*y^3+1.19202707072*internal(1)^6*y^4+0.0896620398272*internal(1)^5*y^5+0.131255388975*internal(1)^4*y^6+0.00451716555891*internal(1)^3*y^7+0.00702493512523*internal(1)^2*y^8+1.6205534493e-05*internal(1)*y^9+0.000111390399979*y^10
%-1.56354150271e-05-0.000324916661386*internal(1)-4.23706356868e-05*y-0.00732021927874*internal(1)^2-0.0539588032637*internal(1)*y+0.00170979816822*y^2+0.00275141462211*internal(1)^3-0.00164114744804*internal(1)^2*y+0.000659955192747*internal(1)*y^2+0.000124691015494*y^3+0.294078745635*internal(1)^4-0.16105590142*internal(1)^3*y-0.0168500393801*internal(1)^2*y^2-0.0171263232044*internal(1)*y^3-6.94694791036e-05*y^4-0.0135212002036*internal(1)^5-0.0135958910899*internal(1)^4*y-0.00854139124541*internal(1)^3*y^2-0.00221532837073*internal(1)^2*y^3-0.000410607871051*internal(1)*y^4+4.71850793512e-05*y^5-2.27810128721*internal(1)^6+1.33287273624*internal(1)^5*y+0.189745065768*internal(1)^4*y^2+0.323869955456*internal(1)^3*y^3+0.0164511083451*internal(1)^2*y^4+0.0147330731557*internal(1)*y^5+0.000147759946473*y^6+0.0142147343483*internal(1)^7+0.0633211123701*internal(1)^6*y+0.0338737466929*internal(1)^5*y^2+0.0203331791061*internal(1)^4*y^3+0.00515143667348*internal(1)^3*y^4+0.00148123595418*internal(1)^2*y^5+9.08563655178e-05*internal(1)*y^6-2.47610433748e-05*y^7+6.54098686718*internal(1)^8-4.53687107816*internal(1)^7*y-0.683348238559*internal(1)^6*y^2-1.79295112447*internal(1)^5*y^3-0.194413906949*internal(1)^4*y^4-0.183334704271*internal(1)^3*y^5-0.0045757185032*internal(1)^2*y^6-0.00582506530131*internal(1)*y^7-0.000118644134103*y^8-0.000101823710748*internal(1)^9-0.0525444732999*internal(1)^8*y-0.030569500458*internal(1)^7*y^2-0.02621717667*internal(1)^6*y^3-0.00863888589922*internal(1)^5*y^4-0.00360327720608*internal(1)^4*y^5-0.000558422681773*internal(1)^3*y^6-0.000193169795549*internal(1)^2*y^7-5.21470982513e-06*internal(1)*y^8+2.39385614343e-06*y^9-5.81750456761*internal(1)^10+3.81612864516*internal(1)^9*y+0.364036341429*internal(1)^8*y^2+2.13337864284*internal(1)^7*y^3+0.279218542289*internal(1)^6*y^4+0.348799597603*internal(1)^5*y^5+0.0260898576038*internal(1)^4*y^6+0.0241097291728*internal(1)^3*y^7-0.000181396757147*internal(1)^2*y^8+0.00054321779282*internal(1)*y^9+2.12447935703e-05*y^10
%{

syms x y
s = '0.00244730907255-0.0665811632785*internal(1)+0.613467076354*internal(1)^2-1.86283253462*internal(1)^3+1.75636552469*internal(1)^4+0.838677471735*internal(1)^5-1.66179443944*internal(1)^6-0.176206153539*internal(1)^7+0.501837430523*internal(1)^8+0.0876828106449*internal(1)^9-0.0270341008909*internal(1)^10-0.00378551931696*internal(1)^11+0.000215825221517*internal(1)^12'
%v = strrep(s,'internal(1)','x');
v = strrep(s,'internal(2)','y');
v = eval(v);
fc = fcontour(v, 'r');
fc.LevelList = [0];

fc = fcontour(v, 'm');
fc.LevelList = [-1];

%}