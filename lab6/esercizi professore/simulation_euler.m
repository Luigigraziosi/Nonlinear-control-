clear all
close all 
clc

w0=[0.25;0;0.63];

[tt,w]=ode45(@euler_eq,[0 10],w0);

figure
plot(tt,w,'linewidth',1)
xlabel('time [s]','fontsize',16)
ylabel('\omega','fontsize',20)

figure, hold on, grid
plot3(w(:,1),w(:,2),w(:,3))
mArrow3(zeros(3,1),w0);
mArrow3(zeros(3,1),w(end,:));
view(40,20)
xlabel('x','fontsize',18)
ylabel('y','fontsize',18)
zlabel('z','fontsize',18)
