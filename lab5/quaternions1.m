clear all
close all
clc 

r=[-2.5;0.4;3]
%r=[0;3;0];

ph=75/180*pi;
q1=[cos(ph/2);sin(ph/2);0;0];
q1s=[cos(ph/2);-sin(ph/2);0;0];

p=quatprod([0;r],q1s);
p=quatprod(q1,p);
p=p(2:4)

norm(r)
norm(p)

% figure, 
% grid on, hold on
% mArrow3(zeros(3,1),r);
% mArrow3(zeros(3,1),p,'color','r');
% view(60,25)
% xlabel('x')
% ylabel('y')
% zlabel('z')
