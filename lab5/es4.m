%Laboratorio 5 
clear all
clc
close all

T = [0.2276 -0.9354 0.2706
    0.7571 -0.004773 -0.6533
    0.6124 0.3536 0.7071];
p = [0.588; 0.03378; -0.2566; 0.7663]

q0 = 1/2*sqrt(T(3,1) + T(2,2) + T(3,3) + 1);
qT = [T(3,2)-T(2,3)
    T(1,3)-T(3,1)
    T(2,1)-T(1,2)];
qbold = 1/4/q0 * qT;
q = [q0; qbold]

w = q(1);
x = q(2);
y = q(3);
z = q(4);
DCM = [w^2 + x^2 - y^2 - z^2 2*x*y - 2*w*z 2*x*z + 2*w*y;
       2*x*y + 2*w*z w^2 - x^2 + y^2 - z^2 2*y*z - 2*w*x;
       2*x*z - 2*w*y 2*y*z + 2*w*x w^2 - x^2 - y^2 + z^2]

ph1=atan2(DCM(1,3),-DCM(2,3))
th1=atan2(sin(ph1)*DCM(1,3)-cos(ph1)*DCM(2,3),DCM(3,3))
ps1=atan2(-cos(ph1)*DCM(1,2)-sin(ph1)*DCM(2,2),cos(ph1)*DCM(1,1)+sin(ph1)*DCM(2,1))
