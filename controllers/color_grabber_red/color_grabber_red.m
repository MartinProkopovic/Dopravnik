% MATLAB controller for Webots
% File:          color_grabber_red.m
% Date:
% Description:
% Author:
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
%desktop;
%keyboard;

TIME_STEP = 64;
m = 0;
TW = wb_robot_get_device('tw');
finger_1 = wb_robot_get_device('grabber finger A');
finger_2  = wb_robot_get_device('grabber finger B');
finger_3  = wb_robot_get_device('grabber finger C');
pivot_1 = wb_robot_get_device('pivot1');
pivot_2 = wb_robot_get_device('pivot2');
D_R = wb_robot_get_device('red');

speed = 2;
 wb_motor_set_velocity(TW,speed);
 wb_motor_set_velocity(finger_1,speed);
 wb_motor_set_velocity(finger_2,speed);
 wb_motor_set_velocity(finger_3,speed);
 wb_motor_set_velocity(pivot_1,speed);
 wb_motor_set_velocity(pivot_2,speed);
 wb_distance_sensor_enable(D_R,TIME_STEP);
 
while wb_robot_step(TIME_STEP) ~= -1
Sens = wb_distance_sensor_get_value(D_R);


wb_motor_set_position(TW,1.57)
pause(0.5,TIME_STEP)
wb_motor_set_position(finger_1,1.3);
wb_motor_set_position(finger_2,1.3);
wb_motor_set_position(finger_3,1.3);

wb_motor_set_position(pivot_2,1.3);
wb_motor_set_position(pivot_1,0.1);

Sens = wb_distance_sensor_get_value(D_R);
if 600 > Sens 
m = 1;
end
if m == 1
pause(1.65,TIME_STEP)
wb_motor_set_position(finger_1,0);
wb_motor_set_position(finger_2,0);
wb_motor_set_position(finger_3,0);
pause(1,TIME_STEP)
wb_motor_set_position(pivot_2,0);
wb_motor_set_position(pivot_1,0);
end



  drawnow;

end

% cleanup code goes here: write data to files, etc.
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