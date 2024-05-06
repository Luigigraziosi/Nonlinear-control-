%Laboratorio 5 
clear all
clc
close all

r=[-1;4;2];
phi = pi/4;
teta = -pi/6;
psi = pi/3; 

q2 = [cos(teta/2); 0; sin(teta/2); 0];
q3 = [cos(psi/2); 0; 0; sin(psi/2)];
q31 = [cos(phi/2); 0; 0; sin(phi/2)];


q=quatprod(q3,quatprod(q2,q31));
qt = [q(1);-q(2:4)];

r1=quatprod(q,quatprod([0;r],qt));

r1=r1(2:4)

norm(r)
norm(r1)

figure('color','w'), grid, hold on
mArrow3([0;0;0],r,'color','b');
mArrow3([0;0;0],r1,'color','r');
daspect([1 1 1])
view(35,10)