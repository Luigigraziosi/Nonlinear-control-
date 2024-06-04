clear all
close all
clc

load cube
ll=[1.1 1 2];
hr=diag(ll/2)*hr;

J=diag([10 9 12]*1e3)
IJ=inv(J)

th0=0;
q0=[cos(th0/2);0;sin(th0/2);0];
w0=[0;0;0];

th=pi*3/4;
qr=[cos(th/2);0;sin(th/2);0];
wr=[0;0;0];

animation_rot(hr,q0)
view(10,10)

Tfin=3000;

open('sim_tracking_1')