%% Exercise 2
clear
close all
clc

%% Data
a = 40e6; e = 0.5; MU = 0.4e15;
i = 50*pi/180; W = 30*pi/180; w = 100*pi/180;

%% Orbit equation
p = a*(1-e^2); th = linspace(0,2*pi,1000);
R = p./(1+e*cos(th));


r_GE = zeros(3,1000); v_GE = zeros(3,1000);
T = rot_mat([3 1 3],[W i w]);
for i = 1:1000
    x = R(i)*cos(th(i));
    y = R(i)*sin(th(i));
    z = 0;
    
    r_GE(:,i) = T*[x y z]';
    
    x_dot = -sqrt(MU/p)*sin(th(i));
    y_dot = sqrt(MU/p)*(e+cos(th(i)));
    z_dot = 0;
    
    v_GE(:,i) = T*[x_dot y_dot z_dot]';
    
end

% 3D plot
[X,Y,Z] = sphere(100);
rE = 6.38e6; Xe = X*rE; Ye = Y*rE; Ze = Z*rE;

figure
plot3(r_GE(1,:),r_GE(2,:),r_GE(3,:))
hold on
mesh(Xe,Ye,Ze)
grid on
xlabel('x_1'),ylabel('x_2'),zlabel('x_3')
title('Space trajectory')

%% Integration
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

return