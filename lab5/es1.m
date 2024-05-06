%Laboratorio 5 
clear all
clc
close all
syms psi1 teta1 phi1

r=[-1;4;2];
teta = -pi/6;
psi = pi/3; 
phi = pi/4;

T3=[cos(psi) -sin(psi) 0;
    sin(psi) cos(psi) 0;
    0       0       1];

T2=[cos(teta) 0 sin(teta);
    0         1       0;
    -sin(teta) 0 cos(teta)];

T3_1=[cos(phi) -sin(phi) 0;
    sin(phi) cos(phi) 0;
    0       0       1];


T323 = T3 * T2 * T3_1;

r1=T323*r;
[V, D] = eig(T323)
asse = V(:, diag(D) == 1)

norm(r);
norm(r1);

figure('color','w'), grid, hold on
mArrow3([0;0;0],[r],'color','b');
mArrow3([0;0;0],[r1],'color','r');
mArrow3(0,[asse],'color','g');

daspect([1 1 1])
view(35,10)


T3_2=[cos(psi1) -sin(psi1) 0;
    sin(psi1) cos(psi1) 0;
    0       0       1];

T2_1=[cos(teta1) 0 sin(teta1);
    0         1       0;
    -sin(teta1) 0 cos(teta1)]; 
T3_3=[cos(phi1) -sin(phi1) 0;
    sin(phi1) cos(phi1) 0;
    0       0       1];


T323_1 = T3_2 * T2_1 * T3_3;
