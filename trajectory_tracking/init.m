clear all
close all
clc
vrclear
vrclose
addpath('..\visualization\');
load('../kinematic_traj.mat');
clik_inverse;
sim('clik_inverse.mdl', t);
% Uncomment the below two lines (lines 12,13) to visualize the trajectory using jacobian
% transpose method.
% clik_transpose;
% sim('clik_transpose.slx', t);
visualize_results;
SCARA_VR_VISUALIZE(squeeze(q(:,1,:)), true);
