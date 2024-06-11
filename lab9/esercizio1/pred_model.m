function [f,h]=pred_model(t,x,u)
% NMPC prediction model
% t: time (scalar, useful for time-varying systems). 
% x: state of the system (dimension nx1).
% u: input of the system (dimension nux1).
% f,h: functions of the state and output equations: 
% xdot=f(t,x,u); y=h(t,x,u).

global MU

% Initialization
f=zeros(7,1);
r3 = sqrt(sum(x(1:3,:).^2,1)).^3;

% State equations
f(1:3,:) = x(4:6,:);
f(4:6,:) = -MU*x(1:3,:)./r3 + u./x(7,:);
f(7,:)= 0;

% h = x(1:7,:);
% Output equations
h=rv2oe(x);
h(1,:) = sqrt(sum(x(1:3,:).^2,1));    


% %% predmodel nuovo
% 
% d = zeros(3,1);
% f = spacecraft_dynamics(t,x,u,d);
% h=rv2oe(x);





