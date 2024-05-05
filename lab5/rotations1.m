clear all
close all
clc

r=[2;0]

th=pi/3;

T=[cos(th) -sin(th);
    sin(th) cos(th)];

p=T*r

norm(r);
norm(p);

figure, grid, hold on
mArrow3([0;0;0],[r;0],'color','b');
mArrow3([0;0;0],[p;0],'color','r');
daspect([1 1 1])

return
%%

r1=T'*p

norm(r1)

mArrow3([0;0;0],[r1;0],'color','g');


