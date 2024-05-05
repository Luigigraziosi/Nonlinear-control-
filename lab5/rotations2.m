clear all
close all
clc

th=pi/3;

T=[cos(th) -sin(th);
    sin(th) cos(th)];

S=[1 -1 -1  1 1
   1  1 -1 -1 1];
S=diag([0.5 1.5])*S

W=T*S

figure, grid, hold on
plot(S(1,:),S(2,:))
plot(W(1,:),W(2,:),'r')
daspect([1 1 1])
xlim([-2 2])
ylim([-2 2])
