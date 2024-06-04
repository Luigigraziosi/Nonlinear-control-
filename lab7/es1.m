% Esercizio 1 
clear all
close all
clc

J = diag([10000,9000,12000]);
IJ = inv(J);

q0 = [0.6853,0.6953,0.1531,0.1531]';
w0 = [0.53, 0.53,0.053]';

q_r = [1 0 0 0]';
Tfin = 200;
open('Es1sim.slx')
sim('Es1sim.slx')