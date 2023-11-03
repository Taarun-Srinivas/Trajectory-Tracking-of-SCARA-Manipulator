% jacobian_inverse0([2;5;4;6])

function inv_jac = jacobian_inverse(j)
 
%Defining DH parameters for computing transformation matrix
% d0 = 1;
%     
% d1 = 0;
% alpha1 = 0;
% theta1 = q(1);
% a1 = 0.5;
% 
% d2 = 0;
% alpha2 = 0;
% theta2 = q(2);
% a2 = 0.5;
% 
% d3 = q(3);
% alpha3 = 0;
% theta3 = 0;
% a3 = 0;
% 
% d4 = 0;
% alpha4 = 0;
% theta4 = q(4);
% a4 = 0;
% 
% A0B = [1 0 0 0;
%        0 1 0 0;
%        0 0 1 d0;
%        0 0 0 1];
% 
% A10 = [cos(theta1) -sin(theta1)*cos(alpha1) sin(theta1)*sin(alpha1) a1*cos(theta1);
%        sin(theta1) cos(theta1)*cos(alpha1)  -cos(theta1)*sin(alpha1) a1*sin(theta1);
%        0           sin(alpha1)              cos(alpha1)              d1;
%        0           0                        0                        1];
% 
% A21 = [cos(theta2) -sin(theta2)*cos(alpha2) sin(theta2)*sin(alpha2) a2*cos(theta2);
%        sin(theta2) cos(theta2)*cos(alpha2)  -cos(theta2)*sin(alpha2) a2*sin(theta2);
%        0           sin(alpha2)              cos(alpha2)              d2;
%        0           0                        0                        1];
% 
% A32 = [cos(theta3) -sin(theta3)*cos(alpha3) sin(theta3)*sin(alpha3) a3*cos(theta3);
%        sin(theta3) cos(theta3)*cos(alpha3)  -cos(theta3)*sin(alpha3) a3*sin(theta3);
%        0           sin(alpha3)              cos(alpha3)              -d3;
%        0           0                        0                        1];
% 
% A43 = [cos(theta4) -sin(theta4)*cos(alpha4) sin(theta4)*sin(alpha4) a4*cos(theta4);
%        sin(theta4) cos(theta4)*cos(alpha4)  -cos(theta4)*sin(alpha4) a4*sin(theta4);
%        0           sin(alpha4)              cos(alpha4)              d4;
%        0           0                        0                        1];
% 
% T1B = A0B*A10;
% T2B = A0B*A10*A21;
% T3B = A0B*A10*A21*A32;
% T4B = A0B*A10*A21*A32*A43;
% 
% Z0 = [0 0 d0]';
% P = T4B(1:3,4);
% P0 = A0B(1:3,4);
% P1 = T1B(1:3,4);
% Z1 = T1B(1:3,3);
% Z2 = T2B(1:3,3);
% Z3 = T3B(1:3,3);
% P2 = T2B(1:3,4);
% %zero = zeros(3,1);
% cross_z0 = cross(Z0, (P-P0));
% cross_z1 = cross(Z1, (P-P1));
% cross_z3 = cross(Z3, (P-P2));
% 
% j = [cross_z0 cross_z1 Z2 cross_z3; Z0(3) Z1(3) 0 Z3(3)];
inv_jac = inv(j);
% inv_jac = j;


end