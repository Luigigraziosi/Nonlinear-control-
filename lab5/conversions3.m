clear all
close all
clc

beta=randn;

u=randn(3,1);
u=u/norm(u)

q=[cos(beta/2);u*sin(beta/2)]

norm(u)
norm(q)

T=qua2dcm(q)

q1=dcm2qua(T)

T1=qua2dcm(q1)

norm(q-q1)
norm(T-T1)


