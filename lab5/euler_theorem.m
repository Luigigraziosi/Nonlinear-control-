clear all
close all
clc

load cube
uhr=diag(ones(1,3)/3)*hr;

%% Axis of rotation

ph=pi/6;
th=pi/3;
ps=pi/4;

T1=[1 0 0
    0 cos(ph) -sin(ph)
    0 sin(ph) cos(ph)];

T2=[cos(th) 0 sin(th)
    0 1 0
    -sin(th) 0 cos(th)];

T3=[cos(ps) -sin(ps) 0
    sin(ps) cos(ps) 0
    0 0 1];

T=T1*T2*T3

[V,D]=eig(T)

%return

%% Figure

i=find(abs(diag(D)-1)<1e-10)
u=V(:,i)
T*u

uhr1=T*uhr;

lu=1;
fs=24;

figure('color','w'), grid, hold on
mArrow3(0,[-3.19855715851499
-3.27211431702997
-0.250000000000000],'tipWidth',0.015);
text(lu*u(1),lu*u(2),lu*u(3),'$\mathbf{u}$','interpreter','latex','fontsize',fs)
plot3(uhr(1,:),uhr(2,:),uhr(3,:),'linewidth',1.2)
%plot3(uhr1(1,:),uhr1(2,:),uhr1(3,:),'linewidth',1.2)
plot3(uhr(1,1),uhr(2,1),uhr(3,1),'ob')
%plot3(uhr1(1,1),uhr1(2,1),uhr1(3,1),'or')
plot3(uhr(1,2),uhr(2,2),uhr(3,2),'*b')
%plot3(uhr1(1,2),uhr1(2,2),uhr1(3,2),'*r')
daspect([1 1 1])
view(35,10)
xlabel('$x$','interpreter','latex','fontsize',fs)
ylabel('$y$','interpreter','latex','fontsize',fs)
zlabel('$z$','interpreter','latex','fontsize',fs)
return

%% Angle of rotation

beta=acos(real(D(1,1)))
%beta=asin(imag(D(1,1)))
%beta=acos(trace(T)/2-1/2)


