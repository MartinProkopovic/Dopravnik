TIME_STEP = 64;
z= 0;
W = wb_robot_get_device('w');
finger_1 = wb_robot_get_device('grabber finger A');
finger_2  = wb_robot_get_device('grabber finger B');
finger_3  = wb_robot_get_device('grabber finger C');
p_1 = wb_robot_get_device('p1');
p_2 = wb_robot_get_device('p2');
D_W = wb_robot_get_device('white');
speed = 3;
 wb_motor_set_velocity(W,speed);
 wb_motor_set_velocity(finger_1,speed);
 wb_motor_set_velocity(finger_2,speed);
 wb_motor_set_velocity(finger_3,speed);
 wb_motor_set_velocity(p_1,speed);
 wb_motor_set_velocity(p_2,speed);
 wb_distance_sensor_enable(D_W,TIME_STEP);
 
while wb_robot_step(TIME_STEP) ~= -1
if z==0
wb_motor_set_position(W,-1.57)
wb_motor_set_position(finger_1,1.3);
wb_motor_set_position(finger_2,1.3);
wb_motor_set_position(finger_3,1.3);
wb_motor_set_position(p_2,1);
wb_motor_set_position(p_1,-0.5);
pause(0.5,TIME_STEP)
COL = wb_distance_sensor_get_value(D_W);
end 
while wb_robot_step(z==0)
COL = wb_distance_sensor_get_value(D_W);
if 250 > COL && COL > 100
z = 1;
end
end
if z == 1
pause(0.85,TIME_STEP)
wb_motor_set_position(p_2, 1.4);
wb_motor_set_position(p_1, 0.1);
pause(0.2,TIME_STEP)
wb_motor_set_position(finger_1,0.2);
wb_motor_set_position(finger_2,0.2);
wb_motor_set_position(finger_3,0.2);
pause(1,TIME_STEP)
wb_motor_set_position(p_2,-0.3);
wb_motor_set_position(p_1,-0.3);
pause(1,TIME_STEP)
wb_motor_set_position(W,1.57);
pause(1,TIME_STEP)
wb_motor_set_position(p_2,1.1);
pause(1,TIME_STEP)
wb_motor_set_position(finger_1,1);
wb_motor_set_position(finger_2,1);
wb_motor_set_position(finger_3,1);
pause(1,TIME_STEP)
z = 0;

end
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
  end
end