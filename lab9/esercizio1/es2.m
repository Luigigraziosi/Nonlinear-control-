clear all
close all
clc

tot_mass = 1e4;

global ve MU RE
ve = 4.4;
MU = 4e5;
RE = 6371;

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
par.Ts=30;
par.Tp=90;

% Weigth matrices
par.P = diag([1 1e5 1e5 1e5 1e5]);
par.Q = zeros(5,5);
par.R = 0.1*eye(3);

% Command input lower and upper bounds
%par.lb=[-1e10 -1e10 -1e10];
%par.ub=1e10;

par.Tstart =500  % Time at which the NMPC 
% controller is switched on (default=0).

K=nmpc_design_st2(par);
Tfin = 60*60*1.5;

%% Simulation
r0 = [6871 0 0]';
v0=[0 sqrt(MU/r0(1)) 0]';
x0=[r0;v0; tot_mass];
d = zeros(7,1);
dv = [1e-3 1e-3 1e-3 1e-4 1e-4 1e-4 1e-3]';

ar = (RE+500)*1.3;
eer = [0.25 0 0]';
cir = 1;
reference = [ar;eer;cir];

open("es1sim")
res = sim("es1sim")