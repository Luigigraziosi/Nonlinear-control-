clear all
close all
clc

global MU RE ve

%% Plant parameters
mass = 1e4;
totmass = 3e4;
ve = 15;
MU = 4e5;
RE = 6371;
vE = 0.465;
r0 =[RE 0 0]';
v0 = [0 vE 0]';
x0 = [r0; v0; totmass];

d = zeros(7,1);
dv = [1e-3 1e-3 1e-3 1e-4 1e-4 1e-4 1e-3]';

h=500;
a = RE+h;
ee = [0 0 0]';
ci = 1;
reference = [a;ee;ci];

% open('plant_model')
% sim('plant_model')
% return
%% NMPC design

% The prediction model must be defined 
% in a function named pred_model.m
par.nlc=0;  % no state/output constraints (default=0)
% par.nlc=1;  % presence of state/output constraints 
% The constraints must be defined 
% in a function named nlcon.m

% Prediction model order
par.n= 7;

% Sampling time and prediction horizon
par.Ts=50;
par.Tp=450;

% Weigth matrices
par.P= diag([1e2 1e6 1e6 1e6 1e6]);
par.Q= zeros(5,5);
par.R=0.1*eye(3);

% Command input lower and upper bounds
%par.lb=[-1e10 -1e10 -1e10];
%par.ub=1e10;

par.Tstart = 0  % Time at which the NMPC 
% controller is switched on (default=0).

K=nmpc_design_st2(par);
Tfin = 60*60*1.5;

% K: structure used by the NMPC block in Simulink.

%% Simulation

open("es1sim")
res = sim("es1sim")

%% Plot
position = res.rv.Data(:,1:3);
time = res.rv.Time;
[X,Y,Z] = sphere(100);

xE = X*RE;
yE = Y*RE;
zE = Z*RE;

mesh(xE,yE,zE);
hold on
plot3(position(:,1),position(:,2),position(:,3),"r")



