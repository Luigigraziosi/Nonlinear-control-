%% Exercise 2
clear
close all
clc

J = diag([937.5, 833.3, 270.8]);
IJ=inv(J);
w0 = [1,0.1,0]';
beta0 = [0 0 0]';
M = [0,0,0]';



%% Simulation 
M = [0 0 0];
Tfin = 50;

%open("es2sim.slx")
res = sim("es2sim.slx")

res.beta_321.data
angoli = res.beta_321.data*pi/180

%% Euler angles plot
figure
plot(res.beta_321.time,angoli)
grid on
legend('\phi','\theta','\psi')

figure
plot(res.beta_321.time,res.beta_321.data)
grid on
legend('\phi','\theta','\psi')

%% Quaternion
q = zeros(length(res.beta_321.time),4);

for i = 1:length(res.beta_321.time)
    q(i,:) = euler2qua(res.beta_321.data(i,:), 1);
end

figure
plot(res.beta_321.time,q)
grid on
legend('q_0','q_1','q_2','q_3')

