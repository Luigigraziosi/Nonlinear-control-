function mu = mu_chua(in1)
%MU_CHUA
%    MU = MU_CHUA(IN1)

%    This function was generated by the Symbolic Math Toolbox version 23.2.
%    09-Apr-2024 11:57:01

x1 = in1(1,:);
x2 = in1(2,:);
mu = [x1;x1.*2.0176+x2.*(5.2e+1./5.0)-x1.^3.*4.3888e-1];
end
