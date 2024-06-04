%% Esercizio 1
clear all
close all
clc

J = diag([937.5, 833.3, 270.8]);
IJ=inv(J);
q0 = [1,0,0,0]';
w0 = [1,0.1,0]';
M = [0,0,0]';
x0 = [q0; w0];

Tfin = 50;
%open("es1sim.slx")
r = sim("es1sim")

%% Quaternion plot
figure
plot(r.result.time,r.result.data)
grid on
legend('q_0','q_1','q_2','q_3')
% load cube.mat
% for i = 1:length(q.time)
%     animation_rot(hr,q.data(i,:)')
%     pause(0.05)
% end
% ea = qua2euler(r.result(end, :)')

%% TB321

beta_321 = zeros(length(r.result.time),3);

for i = 1:length(r.result.time)
    beta_321(i,:) = qua2euler(r.result.data(i,:))';
end
figure
plot(r.result.time,beta_321)
grid on
legend('\psi','\theta','\phi')
beta_321;

%% Euler 313

beta_313 = zeros(length(r.result.time),3);

for i = 1:length(r.result.time)
    T = qua2dcm(r.result.data(i,:));

    ph = atan2(T(1,3),-T(2,3));
    th = atan2(sin(ph)*T(1,3)-cos(ph)*T(2,3),T(3,3));
    ps = atan2(-cos(ph)*T(1,2)-sin(ph)*T(2,2),cos(ph)*T(1,1)+sin(ph)*T(2,1));

    beta_313(i,:) = [ph,th,ps];
end

figure
plot(r.result.time,beta_313)
grid on
xlabel('Time [s]'), ylabel('Amplitude')
title('Euler 313 representation')
legend('\phi','\theta','\psi')




