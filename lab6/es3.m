%% Exercise 3
clear
close all
clc

J = diag([937.5, 833.3, 270.8]);
IJ=inv(J);
w0 = [1,0.1,0]';
beta0 = [0 0 0]';


%% Simulation 
M = [0 0 0];
Tfin = 50;

open("es3sim")
res = sim("es3sim")

%% Euler angles plot

figure
plot(res.beta_313.time, res.beta_313.data)
grid on
legend('\phi','\theta','\psi')

%% Quaternion
q = zeros(length(res.beta_313.time),4);

for i = 1:length(res.beta_313.time)
    q(i,:) = euler2qua(res.beta_313.data(i,:),2);
end

figure
plot(res.beta_313.time,q)
grid on
legend('q_0','q_1','q_2','q_3')

