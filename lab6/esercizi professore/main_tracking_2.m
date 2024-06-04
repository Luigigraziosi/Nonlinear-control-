clear all
close all
clc

J0=[10 9 12]*1e3;
J=diag(J0)
IJ=inv(J)
satu=150;

q0=[1;0;0;0];
w0=[0;0;0];

wr=[0.3;0;0];

Tfin=2000;

open('sim_tracking_2')