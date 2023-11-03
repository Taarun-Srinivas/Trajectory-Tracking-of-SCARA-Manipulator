function dk = direct_kin(q)
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
    
%     Fetching end effector position and orientation from the final
%     transformation matrix
    position_vector = TB_4(1:3,4);
    orientation = q(1)+q(2)+q(4);
    v = [position_vector; orientation];
    dk = v;
end
