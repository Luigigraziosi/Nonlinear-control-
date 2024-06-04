function q=euler2qua(a,rk)

ph=a(1);
th=a(2);
ps=a(3);

switch rk
    case 1 % Euler 321
        q1=[cos(ps/2);0;0;sin(ps/2)];
        q2=[cos(th/2);0;sin(th/2);0];
        q3=[cos(ph/2);sin(ph/2);0;0];
    case 2 % Euler 313
        q1=[cos(ph/2);0;0;sin(ph/2)];
        q2=[cos(th/2);sin(th/2);0;0];
        q3=[cos(ps/2);0;0;sin(ps/2)];
end

q=quatprod(q1,quatprod(q2,q3));