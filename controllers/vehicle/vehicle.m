% MATLAB controller for Webots
% File:          vehicle.m
% Date:
% Description:
% Author:
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
%desktop;
%keyboard;

TIME_STEP = 64;
p=-1;
t=0;
motor_l = wb_robot_get_device('motor_left');
motor_r = wb_robot_get_device('motor_right');
 c = wb_robot_get_device('dsc');
% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);
%  motor = wb_robot_get_device('motor');
 
wb_motor_set_velocity(motor_l,0);
  wb_motor_set_velocity(motor_r,0);
  wb_distance_sensor_enable(c,TIME_STEP);

% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%
while wb_robot_step(TIME_STEP) ~= -1
D=wb_distance_sensor_get_value(c);
if D > 51 & t==0
  wb_motor_set_position(motor_l,p);
  wb_motor_set_position(motor_r,p);
  pause(0.1,TIME_STEP);
  p=p-1;
  end
  if D < 51
  t=1;
  end
if D < 51 & t==1

wb_motor_set_position(motor_l,0);
wb_motor_set_position(motor_r,0); 
end

  % read the sensors e.g.:
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
% cleanup code goes here: write data to files, etc.
