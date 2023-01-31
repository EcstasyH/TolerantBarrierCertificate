

function Plot2D(sample)
figure (1);

syms x y
s = '0.00127739549276+0.108727153119*internal(1)+0.0105693485061*internal(2)+26.3020893479*internal(1)^2+1.70835452815*internal(2)^2+3.9607753153*internal(1)*internal(2)+32.996876563*internal(1)^3+9.48793950279*internal(1)^2*internal(2)+3.59141831529*internal(1)*internal(2)^2+0.475067628324*internal(2)^3-11.7044274396*internal(1)^4+0.352216966423*internal(1)^3*internal(2)-3.07320594822*internal(1)^2*internal(2)^2+0.337169854022*internal(1)*internal(2)^3-0.0350463092091*internal(2)^4-99.9940175085*internal(1)^5-52.6879916894*internal(1)^4*internal(2)-23.3973485089*internal(1)^3*internal(2)^2-5.83180098195*internal(1)^2*internal(2)^3-0.882562293805*internal(1)*internal(2)^4-0.128746462724*internal(2)^5+99.9571837637*internal(1)^6+23.0541673911*internal(1)^5*internal(2)+22.6604263953*internal(1)^4*internal(2)^2+4.09468618996*internal(1)^3*internal(2)^3+1.67466417018*internal(1)^2*internal(2)^4+0.0995330549293*internal(1)*internal(2)^5+0.0233013849079*internal(2)^6-4.37344235862*internal(1)^7-1.75425736138*internal(1)^6*internal(2)-2.72010407302*internal(1)^5*internal(2)^2-0.262689520459*internal(1)^4*internal(2)^3-0.00279196905934*internal(1)^3*internal(2)^4+0.105063545399*internal(1)^2*internal(2)^5-0.0319289717519*internal(1)*internal(2)^6-0.00112477691724*internal(2)^7'
v = strrep(s,'internal(1)','x');
v = strrep(v,'internal(2)','y');
v = eval(v);
fc = fcontour(v, 'r');