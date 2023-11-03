# Trajectory-Tracking-of-SCARA-Manipulator

The goal of this problem is to track a given trajectory of SCARA manipulator using the jacobian inverse and jacobian transpose methodology.

# Jacobian Inverse
the Jacobian inverse is used to control the robotic manipulator's joint velocities based on the desired end-effector trajectory. In trajectory tracking, the goal is often to make the robot follow a specified path or trajectory accurately. The Jacobian matrix is employed to map the joint velocities to the end-effector velocities, allowing the robot to move along the desired path. The Jacobian inverse can be utilized to calculate the required joint velocities needed to achieve the desired end-effector velocities, thereby enabling the robot to track the trajectory accurately.

# Jacobian Transpose
The Jacobian transpose method is one way to determine the joint velocities required for the robot to follow a specified end-effector trajectory accurately. By taking the transpose of the Jacobian matrix, one can map the end-effector velocities back to the joint velocities. This allows the control system to adjust the joint positions and velocities in real time, enabling the robot to track the desired trajectory closely. While the Jacobian transpose method is simpler computationally compared to the Jacobian inverse method, it may not always provide optimal results, particularly in cases where the Jacobian matrix is not full rank or the robot encounters singular configurations.

# Visualization for Jacobian inverse 
<p align="center">
  <img src="https://github.com/Taarun-Srinivas/Trajectory-Tracking-of-SCARA-Manipulator/assets/52371207/e2ccdc32-4d4f-4f6a-9e54-aff8e660e6e8" width="400" style="margin-right: 30px" />
  <img src="https://github.com/Taarun-Srinivas/Trajectory-Tracking-of-SCARA-Manipulator/assets/52371207/20e8cff2-57dc-4bd0-bd6f-a6a9da7157a7" width="400" style="margin-left: 30px" /> 
</p>

# Visualization for Jacobian Transpose
<p align="center">
  <img src="https://github.com/Taarun-Srinivas/Trajectory-Tracking-of-SCARA-Manipulator/assets/52371207/c8f1d3ff-8724-4f21-880b-f967f672feb0" width="400" style="margin-right: 30px" />
  <img src="https://github.com/Taarun-Srinivas/Trajectory-Tracking-of-SCARA-Manipulator/assets/52371207/72bc920e-0e1d-4cb6-b03f-05305d703c44" width="400" style="margin-left: 30px" /> 
</p>
