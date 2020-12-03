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
f=0;
motor_l = wb_robot_get_device('motor_left');
motor_r = wb_robot_get_device('motor_right');
 c = wb_robot_get_device('dsc');
 Dvs = wb_robot_get_device('Dv');
% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);
%  motor = wb_robot_get_device('motor');
 

  wb_distance_sensor_enable(c,TIME_STEP);
  wb_distance_sensor_enable(Dvs,TIME_STEP);

% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%
while wb_robot_step(TIME_STEP) ~= -1
D=wb_distance_sensor_get_value(c);
E=wb_distance_sensor_get_value(Dvs);

if E < 128
f = 1;
t = 0;
end

if f==1 & t==0
wb_motor_set_velocity(motor_l,6);
  wb_motor_set_velocity(motor_r,6);
wb_motor_set_position(motor_l, p);
wb_motor_set_position(motor_r, p);
pause(0.01, TIME_STEP);
p= p-1
D = wb_distance_sensor_get_value(c); 

if D < 60
t = 1;

end

end

if D < 60 & t==1
wb_motor_set_velocity(motor_l,3);
  wb_motor_set_velocity(motor_r,3);
wb_motor_set_position(motor_l,0);
wb_motor_set_position(motor_r,0); 
p=-1;
f=0;
end
  drawnow;

end

function pause(time_s,wait) 
 start_time = wb_robot_get_time();
  while (start_time + time_s > wb_robot_get_time())
    step1(wait);
    end
    
end

function step1(t) 
  if (wb_robot_step(t) == -1) 
    wb_robot_cleanup();

  end
  end
% cleanup code goes here: write data to files, etc.
