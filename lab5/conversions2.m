clear all
close all
clc 

% conversion DCM -> Tait-Brian angles 321

ph=randn
th=-35/180*pi       % th~=pi,2*pi,...
ps=randn

T=rot_mat([3 2 1],[ps th ph])

ph1=atan2(T(3,2),T(3,3))
th1=atan2(-T(3,1),sin(ph1)*T(3,2)+cos(ph1)*T(3,3))
ps1=atan2(-cos(ph1)*T(1,2)+sin(ph1)*T(1,3),cos(ph1)*T(2,2)-sin(ph1)*T(2,3))