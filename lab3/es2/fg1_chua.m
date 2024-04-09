function xd1 = fg1_chua(in1)
%FG1_CHUA
%    XD1 = FG1_CHUA(IN1)

%    This function was generated by the Symbolic Math Toolbox version 23.2.
%    09-Apr-2024 11:57:00

u1 = in1(1,:);
x1 = in1(2,:);
x2 = in1(3,:);
x3 = in1(4,:);
xd1 = [x1.*(2.08e+2./1.25e+2)+x2.*(5.2e+1./5.0)-x1.^3.*4.264e-1;u1+x1-x2+x3;x2.*(-3.3e+1./2.0)-x3./1.0e+1];
end