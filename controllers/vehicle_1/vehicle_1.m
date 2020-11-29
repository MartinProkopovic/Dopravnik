% MATLAB controller for Webots
% File:          vehicle_1.m
% Date:
% Description:
% Author:
% Modifications:

TIME_STEP = 64;

<<<<<<< HEAD
p=-1;

t=0;
=======
p = -1;
t = 0;
>>>>>>> 7980a182456325be71707679339721112803d872

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
<<<<<<< HEAD
  stop(0.3,TIME_STEP);
=======
  stop(0.3, TIME_STEP);
>>>>>>> 7980a182456325be71707679339721112803d872
  p = p-1;
  end
  
  if dist < 51
  t = 1;
  end
  
if dist < 51 & t == 1
wb_motor_set_position(e_right, 0);
wb_motor_set_position(e_left, 0); 
end
<<<<<<< HEAD

=======
 
>>>>>>> 7980a182456325be71707679339721112803d872
  drawnow;

end

function stop(time, hold) 

<<<<<<< HEAD
 start = wb_robot_get_time();
 
  while (start + time > wb_robot_get_time())
    step(hold);
    end
    
end
function step(t) 

  if (wb_robot_step(t) == -1) 
    wb_robot_cleanup();

  end
  
  end
=======
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


>>>>>>> 7980a182456325be71707679339721112803d872
