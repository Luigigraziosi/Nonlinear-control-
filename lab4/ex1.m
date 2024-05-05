clear all
close all
clc

%% Plant parameters
Tfin = 100
w = 0.0011;
x=sym('x',[6 1],'real');
u=sym('u',[3 1],'real');
A = [0 0 0 1 0 0
    0 0 0 0 1 0
    0 0 0 0 0 1
    3*w^2 0 0 0 2*w 0
    0 0 0 -2*w 0 0
    0 0 -w*w 0 0 0];
B = [zeros(3);eye(3)];
C = eye(6);
D = zeros(6,3);
r = [20 0 0 0 0 0]';
x0 = [100 100 100 0 0 0]';
S = ss(A,B,C,D)
%% NMPC design

% Prediction model and constraint functions
par.model=@pred_model;   
%par.nlc=@nlcon;

% Prediction model order
par.n=6;

% Sampling time and prediction horizon
par.Ts=3;
par.Tp=100;
% Weigth matrices
par.P=10*eye(6);
par.Q=0.1*eye(6);
par.R=eye(3);

% Command input lower and upper bounds
par.lb= ones(3,1)*(-1);
par.ub= ones(3,1)*1';

par.Tstart=0;  % Time at which the NMPC controller is switched on.
% The default value of par.Tstart is 0.

K=nmpc_design_st2(par);
%% Simulation

open('es1sim');
res = sim('es1sim');

data = res.position.Data;
time = res.position.Time;

figure(1)
plot3(data(:,1), data(:,2), data(:,3), 'b');
hold on 
grid on






