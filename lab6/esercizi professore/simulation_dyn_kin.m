clear all
close all
clc

global hr
load cube
hr=diag([1 1.5 3]/2)*hr;

q0=[1;0;0;0];
w0=[0.01;0;1];
x0=[q0;w0];

[t,x]=ode45(@dyn_kin_quat,[0 200],x0);

q=x(:,1:4);
w=x(:,5:7);

figure, grid on
plot(t,q,'linewidth',1)
xlabel('time [s]','fontsize',16)
ylabel('quaternion','fontsize',16)

figure, grid on
plot(t,w,'linewidth',1)
xlabel('time [s]','fontsize',16)
ylabel('\omega','fontsize',20)
