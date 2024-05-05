clear all
close all
clc 

r=[-2.5;0.4;3];

% 321 rotation with angles -75, 30, 40 deg

ps=-75/180*pi;
th=30/180*pi;
ph=40/180*pi;

q3=[cos(ps/2);0;0;sin(ps/2)];
q2=[cos(th/2);0;sin(th/2);0];
q1=[cos(ph/2);sin(ph/2);0;0];

q=quatprod(q3,quatprod(q2,q1))
qs=[q(1);-q(2:4)];

p=quatprod(q,quatprod([0;r],qs));
p=p(2:4)

norm(r)
norm(p)

figure, 
grid on, hold on
mArrow3(zeros(3,1),r,'stemWidth',0.003);
mArrow3(zeros(3,1),p,'color','r','stemWidth',0.003);
view(60,25)
xlabel('x')
ylabel('y')
zlabel('z')
