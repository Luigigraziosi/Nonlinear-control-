% Esercizio 2 
clear all
close all

J = [399 -2.81 -1.31;
    -2.81 377 2.54;
    -1.31 2.54 377];

%J = J + 0.1*J;

IJ = inv(J); 

q0 = [0 0 1 0]';
w0 = [0.1 -0.9 0.12]';
d = 0;

ea_dot_ref = [0.001745 0 0.04859]';
ea0 = [0 0.3927 0]';
Tfin = 1000;

open('es2sim.slx')
sim('es2sim')
