TIME_STEP = 64;
  twister = wb_robot_get_device('twister');
  pivot_A = wb_robot_get_device('pivot A');
  pivot_B = wb_robot_get_device('pivot B');
  finger_a = wb_robot_get_device('grabber finger A');
  finger_b  = wb_robot_get_device('grabber finger B');
  finger_c  = wb_robot_get_device('grabber finger C');
  DS_L  = wb_robot_get_device('DS_L');
  DS_R  = wb_robot_get_device('DS_R');

  speed = 3;
  wb_motor_set_velocity(twister,speed);
  wb_motor_set_velocity(pivot_A,speed);
  wb_motor_set_velocity(pivot_B,speed);
  wb_motor_set_velocity(finger_a,speed);
  wb_motor_set_velocity(finger_b,speed);
  wb_motor_set_velocity(finger_c,speed);
  wb_distance_sensor_enable(DS_L,TIME_STEP);
  wb_distance_sensor_enable(DS_R,TIME_STEP);

while wb_robot_step(TIME_STEP) ~= -1
Ds=wb_distance_sensor_get_value(DS_R);
dS=wb_distance_sensor_get_value(DS_L);
if Ds < 45 
pause(2.0,TIME_STEP);
wb_motor_set_position(twister,1.57);
pause(1.0,TIME_STEP);
wb_motor_set_position(finger_a,1.1);
wb_motor_set_position(finger_b,1.1);
wb_motor_set_position(finger_c,1.1);
pause(0.5,TIME_STEP);
wb_motor_set_position(pivot_B,1.2);
wb_motor_set_position(pivot_A,0.4);
pause(0.5,TIME_STEP);
wb_motor_set_position(finger_a,0.9);
wb_motor_set_position(finger_b,0.9);
wb_motor_set_position(finger_c,0.9);
pause(0.1,TIME_STEP);
wb_motor_set_position(finger_a,0.7);
wb_motor_set_position(finger_b,0.7);
wb_motor_set_position(finger_c,0.7);
pause(0.1,TIME_STEP);
wb_motor_set_position(finger_a,0.5);
wb_motor_set_position(finger_b,0.5);
wb_motor_set_position(finger_c,0.5);
pause(0.1,TIME_STEP);
wb_motor_set_position(finger_a,0.3);
wb_motor_set_position(finger_b,0.3);
wb_motor_set_position(finger_c,0.3);
pause(0.1,TIME_STEP);
wb_motor_set_position(finger_a,0);
wb_motor_set_position(finger_b,0);
wb_motor_set_position(finger_c,0);
pause(1.0,TIME_STEP);
wb_motor_set_position(pivot_A,0);
wb_motor_set_position(pivot_B,0);
pause(0.5,TIME_STEP);
wb_motor_set_position(twister,0);
pause(1.0,TIME_STEP);
wb_motor_set_position(pivot_A,-0.3);
wb_motor_set_position(pivot_B,0.7);
pause(0.5,TIME_STEP);
wb_motor_set_position(pivot_A,-0.6);
wb_motor_set_position(pivot_B,1.5);
pause(1.0,TIME_STEP);
wb_motor_set_position(finger_a,1.1);
wb_motor_set_position(finger_b,1.1);
wb_motor_set_position(finger_c,1.1);
pause(1.0,TIME_STEP);
wb_motor_set_position(pivot_A,0);
wb_motor_set_position(pivot_B,0);
pause(1.0,TIME_STEP);
end


if dS < 70
pause(2.0,TIME_STEP);
wb_motor_set_position(twister,-1.57);
pause(1.0,TIME_STEP);
wb_motor_set_position(finger_a,1.1);
wb_motor_set_position(finger_b,1.1);
wb_motor_set_position(finger_c,1.1);
pause(0.5,TIME_STEP);
wb_motor_set_position(pivot_B,1.2);
wb_motor_set_position(pivot_A,0.4);
pause(0.5,TIME_STEP);
wb_motor_set_position(finger_a,0.9);
wb_motor_set_position(finger_b,0.9);
wb_motor_set_position(finger_c,0.9);
pause(0.1,TIME_STEP);
wb_motor_set_position(finger_a,0.7);
wb_motor_set_position(finger_b,0.7);
wb_motor_set_position(finger_c,0.7);
pause(0.1,TIME_STEP);
wb_motor_set_position(finger_a,0.5);
wb_motor_set_position(finger_b,0.5);
wb_motor_set_position(finger_c,0.5);
pause(0.1,TIME_STEP);
wb_motor_set_position(finger_a,0.3);
wb_motor_set_position(finger_b,0.3);
wb_motor_set_position(finger_c,0.3);
pause(0.1,TIME_STEP);
wb_motor_set_position(finger_a,0);
wb_motor_set_position(finger_b,0);
wb_motor_set_position(finger_c,0);
pause(1,TIME_STEP);
wb_motor_set_position(pivot_A,0);
wb_motor_set_position(pivot_B,0);
pause(0.5,TIME_STEP);
wb_motor_set_position(twister,0);
pause(1.0,TIME_STEP);
wb_motor_set_position(pivot_A,-0.3);
wb_motor_set_position(pivot_B,0.7);
pause(0.5,TIME_STEP);
wb_motor_set_position(pivot_A,-0.6);
wb_motor_set_position(pivot_B,1.5);
pause(0.5,TIME_STEP);
wb_motor_set_position(finger_a,1.1);
wb_motor_set_position(finger_b,1.1);
wb_motor_set_position(finger_c,1.1);
pause(1.0,TIME_STEP);
wb_motor_set_position(pivot_A,0);
wb_motor_set_position(pivot_B,0);
pause(1.0,TIME_STEP);
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