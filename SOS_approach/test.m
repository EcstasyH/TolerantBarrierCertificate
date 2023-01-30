syms x y d;

F = y + 2

figure (1);
hold on;

f0=fcontour(@(x,y) F, 'LineColor','r', 'LevelList',[0 0]);