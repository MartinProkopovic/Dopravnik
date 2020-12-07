TIME_STEP = 64;
o=-1;
r=0;
go=0;
e_right = wb_robot_get_device('engine_right');
e_left = wb_robot_get_device('engine_left');
dist_s = wb_robot_get_device('dist_sens');
dVs = wb_robot_get_device('inf');
wb_motor_set_velocity(e_right, 5);
wb_motor_set_velocity(e_left, 5);
wb_distance_sensor_enable(dist_s, TIME_STEP);
wb_distance_sensor_enable(dVs, TIME_STEP);
while wb_robot_step(TIME_STEP) ~= -1
dist = wb_distance_sensor_get_value(dist_s);
vz = wb_distance_sensor_get_value(dVs);
if vz < 1000
go=1;
r=0;
end
if go==1 & r == 0
  wb_motor_set_position(e_right, o);
  wb_motor_set_position(e_left, o);
stop(0.01, TIME_STEP);
  o= o-1;
  dist = wb_distance_sensor_get_value(dist_s);
    if dist < 65
  r = 1;
  end 
  end
if dist < 65 & r == 1
wb_motor_set_position(e_right, 0);
wb_motor_set_position(e_left, 0); 
o=-1;
go=0;
end

  drawnow;

end

function stop(time, hold) 

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