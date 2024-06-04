clear all
close all
clc

syms x y z w1 w2 w3 real

r=[x;y;z];
w=[w1;w2;w3];

integral_argument=crossprod(r,crossprod(w,r))

expand(integral_argument)



