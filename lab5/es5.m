%Laboratorio 5 
clear all
clc
close all

r=[0;0;1];
psi = pi/2;

T3=[cos(psi) -sin(psi) 0;
    sin(psi) cos(psi) 0;
    0       0       1];

T1 = [1     0         0
      0 cos(psi) -sin(psi)
      0 sin(psi) cos(psi)];

T13 = T1*T3;
T31 = T3*T1;

r1 = T1*r;
r2 = T31 * r;
r3 = T3*r;
r4 = T13 * r;

tolerance = 1e-10; % piccolo margine per considerare gli autovalori vicini a 1 come reali

[V1, D1] = eig(T1);
asse1 = V1(:, diag(D1) == 1)

[V2, D2] = eig(T31);
indice_autovettori2 = abs(diag(D2) - 1) < tolerance;
asse2 = V2(:, indice_autovettori2)

[V3, D3] = eig(T3);
asse3 = V3(:, diag(D3) == 1)

[V4, D4] = eig(T13);
indice_autovettori4 = abs(diag(D4) - 1) < tolerance;
asse4 = V4(:, indice_autovettori4)

% norm(r);
% norm(r1);
% norm(r2);
% norm(r3);
% norm(r4);
% 
% figure('color','w'), grid, hold on
% 
% mArrow3([0;0;0],[r],'color','b');
% 
% mArrow3([0;0;0],[r1],'color','r');
% mArrow3(0,[asse1],'color','g');
% 
% mArrow3([0;0;0],[r2],'color','r');
% mArrow3(0,[asse2],'color','g');
% 
% mArrow3([0;0;0],[r3],'color','r');
% mArrow3(0,[asse3],'color','g');
% 
% mArrow3([0;0;0],[r4],'color','r');
% mArrow3(0,[asse4],'color','g');
% 
% daspect([1 1 1])
% view(35,10)











