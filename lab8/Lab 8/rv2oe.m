function y=rv2oe(x,MU)

% x: n by N matrix, where 
% n=6 or n=7: number of state variables
% N: number of samples

if nargin<2
    global MU
end

Iv=[1;0;0];
Kv=[0;0;1];

rr=x(1:3,:);
vv=x(4:6,:);
r=ew_norm(rr);
v=ew_norm(vv);

hh=crossprod(rr,vv);
h=ew_norm(hh);
hhn=hh./h;

ee=1/MU*crossprod(vv,hh)-rr./r;
e=ew_norm(ee);

p=h.^2/MU;
a=p./max(1-e.^2,1e-4);
ci=Kv'*hhn;

y=[p;ee;ci];

end

function no=ew_norm(x)
no=sqrt(sum(x.^2,1));
end
