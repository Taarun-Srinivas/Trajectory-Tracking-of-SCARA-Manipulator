function J = jacobian(q)
 
%Defining DH parameters for computing transformation matrix
d0 = 1;
    
d1 = 0;
alpha1 = 0;
theta1 = q(1);
a1 = 0.5;

d2 = 0;
alpha2 = 0;
theta2 = q(2);
a2 = 0.5;

d3 = q(3);
alpha3 = 0;
theta3 = 0;
a3 = 0;

d4 = 0;
alpha4 = 0;
theta4 = q(4);
a4 = 0;

%     Homogenous transformation of frame 0 relative to base frame
AB_0 = [1 0 0 0;
       0 1 0 0;
       0 0 1 d0;
       0 0 0 1];

%     Homogenous transformation of frame 1 relative to frame 0
A0_1 = [cos(theta1) -sin(theta1)*cos(alpha1) sin(theta1)*sin(alpha1) a1*cos(theta1);
       sin(theta1) cos(theta1)*cos(alpha1)  -cos(theta1)*sin(alpha1) a1*sin(theta1);
       0           sin(alpha1)              cos(alpha1)              d1;
       0           0                        0                        1];

%     Homogenous transformation of frame 2 relative to frame 1
A1_2 = [cos(theta2) -sin(theta2)*cos(alpha2) sin(theta2)*sin(alpha2) a2*cos(theta2);
       sin(theta2) cos(theta2)*cos(alpha2)  -cos(theta2)*sin(alpha2) a2*sin(theta2);
       0           sin(alpha2)              cos(alpha2)              d2;
       0           0                        0                        1];

%     Homogenous transformation of frame 3 relative to frame 2
A2_3 = [cos(theta3) -sin(theta3)*cos(alpha3) sin(theta3)*sin(alpha3) a3*cos(theta3);
       sin(theta3) cos(theta3)*cos(alpha3)  -cos(theta3)*sin(alpha3) a3*sin(theta3);
       0           sin(alpha3)              cos(alpha3)              -d3;
       0           0                        0                        1];

%     Homogenous transformation of frame 4 relative to frame 3
A3_4 = [cos(theta4) -sin(theta4)*cos(alpha4) sin(theta4)*sin(alpha4) a4*cos(theta4);
       sin(theta4) cos(theta4)*cos(alpha4)  -cos(theta4)*sin(alpha4) a4*sin(theta4);
       0           sin(alpha4)              cos(alpha4)              d4;
       0           0                        0                        1];

%     Composition of homogenous transformation of base 1 relative to
%     base frame
TB_1 = AB_0*A0_1;


 %     Composition of homogenous transformation of base 2 relative to
 %     base frame
TB_2 = AB_0*A0_1*A1_2;


 %     Composition of homogenous transformation of base 3 relative to
 %     base frame
TB_3 = AB_0*A0_1*A1_2*A2_3;

 %     Composition of homogenous transformation of base 4 relative to
 %     base frame
TB_4 = AB_0*A0_1*A1_2*A2_3*A3_4;

%Calculating jacobian values for joint J1
Z0 = [0 0 d0]';
P = TB_4(1:3,4);
P0 = AB_0(1:3,4);
cross_z0 = cross(Z0, (P-P0));

%Calculating jacobian values for joint J2
P1 = TB_1(1:3,4);
Z1 = TB_1(1:3,3);
cross_z1 = cross(Z1, (P-P1));

% Calculating jacobian values for joint J3
Z2 = TB_2(1:3,3);

% Calculating jacobian values for joint J4
Z3 = TB_3(1:3,3);
P2 = TB_2(1:3,4);
cross_z3 = cross(Z3, (P-P2));

j = [cross_z0 cross_z1 Z2 cross_z3; Z0(3) Z1(3) 0 Z3(3)];

% Final jacobian matrix
J = j;

end