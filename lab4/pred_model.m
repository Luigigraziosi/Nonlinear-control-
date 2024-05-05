function [f,h] = pred_model(t,x,u)
% NMPC prediction model
% t: time (scalar). 
% t is useful only in the case of time-varying system.
% x: state of the system (dimension n*1).
% u: input of the system (dimension nu*1).
% f,h: functions of the state and output equations: 
% xdot=f(t,x,u); y=h(t,x,u).

% % Initialization
% f=zeros(n,1);
% h=zeros(ny,1);
w = 0.0011;

f(1,:) = x(4,:);
f(2,:) = x(5,:);
f(3,:) = x(6,:);
f(4,:) = 3*w^2*x(1,:)+2*w*x(5,:)+u(1,:);
f(5,:) = -2*w*x(4,:)+u(2,:);
f(6,:) = -w^2*x(3,:)+u(3,:);

h=x;