function mu = mu_chua(in1)
%MU_CHUA
%    MU = MU_CHUA(IN1)

%    This function was generated by the Symbolic Math Toolbox version 23.2.
%    09-Apr-2024 11:56:08

x1 = in1(1,:);
x2 = in1(2,:);
mu = [x1;x1.*(2.08e+2./1.25e+2)+x2.*(5.2e+1./5.0)-x1.^3.*4.264e-1];
end
