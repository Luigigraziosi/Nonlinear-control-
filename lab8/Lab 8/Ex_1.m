%% Exercise 1
clear
close all
clc

%% Data
r0 = [6.54e6 0 0]';
v0 = [0 7.88e3 0]';

%% Integration
MU = 0.4e15; P = 2e4;
x0 = [r0;v0];

[t,x] = ode23tb(@(t,x) fr2b(t,x,MU),[0 P],x0);

%% Plot
% Position vector
r_norm = zeros(1,length(t));
for i = 1:length(t)
    r_norm(i) = norm(x(i,1:3));
end

figure
plot(t,r_norm)
grid on
xlabel('t'),ylabel('||r||')
title('Position vector norm')

% 3D plot
[X,Y,Z] = sphere(100);
rE = 6.38e6; Xe = X*rE; Ye = Y*rE; Ze = Z*rE;

figure
plot3(x(:,1),x(:,2),x(:,3))
hold on
mesh(Xe,Ye,Ze)
grid on
xlabel('x_1'),ylabel('x_2'),zlabel('x_3')
title('Space trajectory')

% Energy plot
E = zeros(1,length(t));
for i = 1:length(t)
    r = norm(x(i,1:3));
    v = norm(x(i,4:6));
    E(i) = (v^2)/2 - MU/r; 
end

figure
plot(t,E)
grid on
xlabel('t'),ylabel('E')
title('Mechanical Energy')


% Angular momentum plot
H = zeros(1,length(t));
for i = 1:length(t)
    r = x(i,1:3);
    v = x(i,4:6);
    H(i) = norm(cross(r,v)); 
end

figure
plot(t,H)
grid on
xlabel('t'),ylabel('H')
title('Angular momentum')

%% ORE
th = linspace(0,2*pi,length(t));
x_ORE = zeros(length(t),3);

for i = 1:length(t)
    y = rv2oe(x(i,:)',MU);
    p = y(1); e = norm(y(2:4));
    R = p/(1+e*cos(th(i)));
    
    x_ORE(i,:) = [R*cos(th(i)) R*sin(th(i)) 0];
end

% 3D plot
figure
plot3(x_ORE(:,1),x_ORE(:,2),x_ORE(:,3),'b')
hold on
plot3(x(:,1),x(:,2),x(:,3),'r--')
hold on
mesh(Xe,Ye,Ze)
grid on
xlabel('x_1'),ylabel('x_2'),zlabel('x_3')
title('Space trajectory')
