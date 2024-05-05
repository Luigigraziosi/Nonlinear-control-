clear all
close all
clc 

% conversion DCM -> proper Euler angles 313

ph=randn
th=25/180*pi    % th~=0
ps=randn

T=rot_mat([3 1 3],[ph th ps])

ph1=atan2(T(1,3),-T(2,3))
th1=atan2(sin(ph1)*T(1,3)-cos(ph1)*T(2,3),T(3,3))
ps1=atan2(-cos(ph1)*T(1,2)-sin(ph1)*T(2,2),cos(ph1)*T(1,1)+sin(ph1)*T(2,1))