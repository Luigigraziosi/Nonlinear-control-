%% Exercise 2
clear
close all
clc

%% Data
a = 40e6;
e = 0.5;
MU = 0.4e15;
i = 50*pi/180;
W = 30*pi/180;
w = 100*pi/180;

th = linspace(0, 2*pi, 1000);
p = a*(1-e^2);
r = p./(1+e*cos(th));

r_GE = zeros(3,1000); v_GE = zeros(3,1000);
T = rot_mat([3 1 3],[W i w]);

x = r.*cos(th);
y = r.*sin(th);
z = zeros(1,1000);

x_dot = -sqrt(MU/p)*sin(th);
y_dot = sqrt(MU/p)*(e+cos(th));
z_dot = zeros(1,1000);

for i = 1:1000
    r_GE(:,i) = T*[x(i) y(i) z(i)]';
    
    v_GE(:,i) = T*[x_dot(i) y_dot(i) z_dot(i)]';
end
[X,Y,Z] = sphere(100);
re = 6.38e6;
Xe = X*re;
Ye = Y*re;
Ze = Z*re;

figure
mesh(Xe,Ye,Ze)
hold on 
plot3(r_GE(1,:),r_GE(2,:),r_GE(3,:))
grid on
%% Point b 
x0 = [r_GE(1:3)'; v_GE(1:3)'];
P = 2*pi*sqrt((a^3)/MU);

[t,x] = ode23tb(@(t,x) fr2b(t,x,MU),linspace(0,2*P,1000),x0);

figure
plot3(r_GE(1,:),r_GE(2,:),r_GE(3,:),'b')
hold on
plot3(x(:,1),x(:,2),x(:,3),'r--')
hold on
mesh(Xe,Ye,Ze)
grid on
xlabel('x_1'),ylabel('x_2'),zlabel('x_3')
title('Space trajectory')





