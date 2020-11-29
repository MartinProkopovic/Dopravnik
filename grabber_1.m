% MATLAB controller for Webots
% File:          grabber_1.m
% Date:
% Description:
% Author:
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
%desktop;
%keyboard;

TIME_STEP = 64;

% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
% wb_camera_enable(camera, TIME_STEP);
  twister = wb_robot_get_device('twister');
  pivot_A = wb_robot_get_device('pivot A');
  pivot_B = wb_robot_get_device('pivot B');
  finger_a = wb_robot_get_device('grabber finger A');
  finger_b  = wb_robot_get_device('grabber finger B');
  finger_c  = wb_robot_get_device('grabber finger C');
  DS_L  = wb_robot_get_device('DS_L');
  DS_R  = wb_robot_get_device('DS_R');

  speed = 2;
  wb_motor_set_velocity(twister,speed);
  wb_motor_set_velocity(pivot_A,speed);
  wb_motor_set_velocity(pivot_B,speed);
  wb_motor_set_velocity(finger_a,speed);
  wb_motor_set_velocity(finger_b,speed);
  wb_motor_set_velocity(finger_c,speed);
  wb_distance_sensor_enable(DS_L,TIME_STEP);
  wb_distance_sensor_enable(DS_R,TIME_STEP);
  % main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%
while wb_robot_step(TIME_STEP) ~= -1
dS=wb_distance_sensor_get_value(DS_L);
 
if dS < 45
pause(2.0,TIME_STEP);
wb_motor_set_position(twister,-1.57);
pause(1.0,TIME_STEP);
wb_motor_set_position(finger_a,1.1);
wb_motor_set_position(finger_b,1.1);
wb_motor_set_position(finger_c,1.1);
pause(1.0,TIME_STEP);
wb_motor_set_position(pivot_A,0.4);
wb_motor_set_position(pivot_B,1.2);
pause(1.0,TIME_STEP);
wb_motor_set_position(finger_a,0.2);
wb_motor_set_position(finger_b,0.2);
wb_motor_set_position(finger_c,0.2);
pause(1.0,TIME_STEP);
wb_motor_set_position(pivot_A,0);
wb_motor_set_position(pivot_B,0);
pause(1.0,TIME_STEP);
wb_motor_set_position(twister,-0);
pause(1.0,TIME_STEP);
wb_motor_set_position(pivot_A,0.2);
wb_motor_set_position(pivot_B,0.8);
pause(1.0,TIME_STEP);
wb_motor_set_position(finger_a,1.1);
wb_motor_set_position(finger_b,1.1);
wb_motor_set_position(finger_c,1.1);
pause(1.0,TIME_STEP);
wb_motor_set_position(pivot_A,0);
wb_motor_set_position(pivot_B,0);
pause(1.0,TIME_STEP);
end
%wb_motor_set_position(twister,1.57);

%wait_a_while(2.0,TIME_STEP);
%wb_motor_set_position(twister,0);
%wait_a_while(2.0,TIME_STEP);


  % read the sensors, e.g.:
  %  rgb = wb_camera_get_image(camera);

  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:
  %  wb_motor_set_postion(motor, 10.0);

  % if your code plots some graphics, it needs to flushed like this:
  drawnow;

end



function pause(time_s,wait) 
 start_time = wb_robot_get_time();
  while (start_time + time_s > wb_robot_get_time())
    step(wait);
    end
end
function step(t) 
  if (wb_robot_step(t) == -1) 
    wb_robot_cleanup();

  end
  end
% cleanup code goes here: write data to files, etc
