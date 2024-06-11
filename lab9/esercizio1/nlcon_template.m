function F=nlcon(x,y)
% NMPC constraint function
% x: state of the system; matrix of dimension n*N.
% y: output of the system; matrix of dimension ny*N.
% N is the number of samples in the time interval [t,t+Tp].
% F: constraint function; Nc*N matrix, where
% Nc is the number of constraints.
% Constraints are written in the standard form F(x,y)<=0.

% Initialization
N=size(x,2);
Nc=...;
F=zeros(Nc,N);

% Constraint functions
F(1,:) = ...;
% F(2,:) = ...;





