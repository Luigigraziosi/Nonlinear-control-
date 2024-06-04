clear all
close all
clc


r0 = [6.5e6 0 0]';
v0 = [0 7.88e3 0]';
t = [0, 2e4];
x0 = [r0;v0];
MU = 0.4e15;


[t, x] = ode23tb(@(t,x) fr2b(t,x,MU), t, x0);

r_norm = zeros(1,length(t));

for i = 1:length(t)
    r_norm(i) = norm(x(i,1:3));
end

figure
plot(t,r_norm)
grid on
xlabel('t'),ylabel('||r||')
title('Position vector norm')

%% 3D Plot
[X,Y,Z] = sphere(100);
re = 6.38e6;
Xe = X*re;
Ye = Y*re;
Ze = Z*re;

figure
plot3(x(:,1),x(:,2),x(:,3))
hold on 
mesh(Xe,Ye,Ze)
grid on
%% Plot of mechanical energy and angular moment

Me = zeros(1,length(t));

%Mechanical energy
for i = 1:length(t)
    Me(i) = norm(x(i,4:6))^2/2 - MU/norm(x(i,1:3));
end

Am = zeros(1,length(t));
for i = 1:length(t)
    Am(i) = norm(cross(x(i,1:3),x(i,4:6)));
end
figure
plot(t,Me)
grid on
title('Mechanical Energy')

figure
plot(t,Am)
grid on
title('Angular Moment')

%% ORE

th = linspace(0,2*pi,length(t)); %crea un vettore di th suddividendo [0;2*pi] in lengh(t) valori

x_ORE = zeros(length(t),3);

for i = 1:length(t)
    

    rr = x(i,1:3);
    r = norm(rr);
    vv = x(i,4:6);
    v = norm(vv);
    hh = cross(x(i,1:3),x(i,4:6));
    h = norm(cross(x(i,1:3),x(i,4:6)));
    ee = 1/MU* cross(vv,hh)- rr./r;
    e = norm(ee);
    p = h^2/MU;
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







