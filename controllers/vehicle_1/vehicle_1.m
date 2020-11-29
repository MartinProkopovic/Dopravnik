% MATLAB controller for Webots
% File:          vehicle_1.m
% Date:
% Description:
% Author:
% Modifications:

TIME_STEP = 64;

p = -1;
t = 0;

e_right = wb_robot_get_device('engine_right');
e_left = wb_robot_get_device('engine_left');
dist_s = wb_robot_get_device('dist_sens');

wb_motor_set_velocity(e_right, 4);
wb_motor_set_velocity(e_left, 4);
wb_distance_sensor_enable(dist_s, TIME_STEP);

while wb_robot_step(TIME_STEP) ~= -1

dist = wb_distance_sensor_get_value(dist_s);

if dist > 51 & t == 0
  wb_motor_set_position(e_right, p);
  wb_motor_set_position(e_left, p);
  stop(0.3, TIME_STEP);
  p = p-1;
  end
  
  if dist < 51
  t = 1;
  end
  
if dist < 51 & t == 1
wb_motor_set_position(e_right, 0);
wb_motor_set_position(e_left, 0); 
end
 
  drawnow;

end

function stop(time, hold) 

 Btime = wb_robot_get_time();
 
  while (Btime + time > wb_robot_get_time())
    move(hold);
    end
    
end

function move(t) 

  if (wb_robot_step(t) == -1) 
    wb_robot_cleanup();
  end
  
 end


