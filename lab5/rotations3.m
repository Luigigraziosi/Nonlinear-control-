clear all
close all
clc

%syms ph th ps

ph=pi/3;
T1=[1 0 0
    0 cos(ph) -sin(ph)
    0 sin(ph) cos(ph)]

th=pi/10;
T2=[cos(th) 0 sin(th)
    0 1 0
    -sin(th) 0 cos(th)]

ps=pi/4;
T3=[cos(ps) -sin(ps) 0
    sin(ps) cos(ps) 0
    0 0 1]

T123=T1*T2*T3
%return

r=[1;-2;3];

p1=T1*r;
p2=T123*r;

norm(r)
norm(p1)
norm(p2)

figure, grid, hold on
mArrow3([0;0;0],r);
mArrow3([0;0;0],p1,'color','b');
mArrow3([0;0;0],p2,'color','r');
daspect([1 1 1])
view(60,20)
xlabel('x')
ylabel('y')
zlabel('z')








