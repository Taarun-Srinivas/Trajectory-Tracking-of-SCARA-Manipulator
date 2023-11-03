close all;
% Visualization plot
% Current trajectory
X_ct = ef_p1(1,1,:);
X_ct = reshape(X_ct, [1 4001]);
X_ct = X_ct(:);

Y_ct = ef_p1(2,1,:);
Y_ct = reshape(Y_ct, [1 4001]);
Y_ct = Y_ct(:);

Z_ct = ef_p1(3,1,:);
Z_ct = reshape(Z_ct, [1 4001]);
Z_ct = Z_ct(:);

theta_ct = ef_p1(4,1,:);
theta_ct = reshape(theta_ct, [1 4001]);
theta_ct = theta_ct(:);

% Desired trajectory
X_dt = pd(:,1);
Y_dt = pd(:,2);
Z_dt = pd(:,3);
theta_dt = theta_d(:,1);

%Joint values
Q1 = q(1,1,:);
Q1 = reshape(Q1, [1 4001]);
Q1 = Q1(:);

Q2 = q(2,1,:);
Q2 = reshape(Q2, [1 4001]);
Q2 = Q2(:);

Q3 = q(3,1,:);
Q3 = reshape(Q3, [1 4001]);
Q3 = Q3(:);

Q4 = q(4,1,:);
Q4 = reshape(Q4, [1 4001]);
Q4 = Q4(:);



figure(1);
subplot(5,1,1); plot(t, X_dt-X_ct); ylabel('error - X');
title('error plot');
subplot(5,1,2); plot(t, Y_dt-Y_ct); ylabel('error - Y');
subplot(5,1,3); plot(t, Z_dt-Z_ct); ylabel('error - Z');
subplot(5,1,4); plot(t, theta_dt-theta_ct); ylabel('error - Phi');
xlabel('Time');
subplot(5,1,5);


figure(2);
subplot(5,1,1); plot(t, Q1); ylabel('J1 - revolute');
title('Joint values');
subplot(5,1,2); plot(t, Q2); ylabel('J2 - revolute');
subplot(5,1,3); plot(t, Q3); ylabel('J3 - prismatic');
subplot(5,1,4); plot(t, Q4); ylabel('J4 - revolute');
xlabel('Time');
subplot(5,1,5);







