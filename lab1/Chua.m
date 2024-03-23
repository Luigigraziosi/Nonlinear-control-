function x_dot = Chua(x)

a = 10;
b = 100/7;
u= 0;
R=0;
p = 2* (x(1)^3/7) - 8*x(1)/7;

x_dot = zeros(3,1);
x_dot(1) = a * (x(2) - x(1) - p);
x_dot(2) = x(1)-x(2) + x(3) + u;
x_dot(3) = -b*x(2) - R*x(3);
end