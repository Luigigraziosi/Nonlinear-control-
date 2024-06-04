function beta_dot = kinTB_321(w,beta)
%The function kinTB_321(w,beta) compute the kinematics of TB-321 using the
%inverse of the DCM matrix. The parametres are omega, the angular velocity,
%and angles.

ph = beta(1);
th = beta(2);
ps = beta(3);

T = [cos(th) sin(ph)*sin(th) cos(ph)*sin(th);
       0 cos(ph)*cos(th) -cos(th)*sin(ph);
       0         sin(ph)          cos(ph)];
T = T/cos(th);
   
beta_dot = T*w;

end