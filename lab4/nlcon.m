function F = nlcon(x,y)
% NMPC constraint function
% x: state of the system; matrix of dimension n*N.
% y: output of the system; matrix of dimension ny*N.
% N is the number of samples in the time interval [t,t+Tp]
% N is automatically chosen by the NMPC solver.
% F: constraint function; 
% Constraints are written in the standard form F(x,y)<=0.

F(1,:) = 10-vecnorm(x(1:3,:));

end