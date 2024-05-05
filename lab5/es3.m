%Laboratorio 5 
clear all
clc
close all

q = [0.866; 0.4319; 0.216;0.1296];
p = [0.9659; 0.183; 0; 0.183];
J = [1;0;0;0];

qr = [q(1); -q(2:4)]/norm(q);
pr = [p(1); -p(2:4)]/norm(p);

qp = q(2:4)'*p(2:4);
pq = p(2:4)'*q(2:4);

cqp = [ q(3)*p(4)-q(4)*p(3)
    q(4)*p(2)-q(2)*p(4)
    q(2)*p(3)-q(3)*p(2)];

cpq = [ p(3)*q(4)-p(4)*q(3)
    p(4)*q(2)-p(2)*q(4)
    p(2)*q(3)-p(3)*q(2)];

cross_productqp = cross(q(2:4), p(2:4));
cross_productpq = cross(p(2:4), q(2:4));

qxp = [q(1)*p(1)-qp; (q(1)*p(2:4) + p(1)*q(2:4)+ cqp)];
pxq = [q(1)*p(1)-pq; ( p(1)*q(2:4)+ q(1)*p(2:4) + cpq)];

qxp1 = quatprod(q,p);
pxq1 = quatprod(p,q);

pJ = quatprod(p,J);
Jp = quatprod(J,p);

