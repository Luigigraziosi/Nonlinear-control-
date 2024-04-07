function u = u_chua(in1)
%U_CHUA
%    U = U_CHUA(IN1)

%    This function was generated by the Symbolic Math Toolbox version 23.2.
%    07-Apr-2024 15:52:11

v = in1(1,:);
x1 = in1(2,:);
x2 = in1(3,:);
x3 = in1(4,:);
u = v.*(5.0./5.2e+1)-x1+x2-x3+(x1.^2.*1.2792-2.08e+2./1.25e+2).*(x1.*(2.08e+2./1.25e+2)+x2.*(5.2e+1./5.0)-x1.^3.*4.264e-1).*(5.0./5.2e+1);
end
