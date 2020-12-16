TIME_STEP = 64;
  twister = wb_robot_get_device('twister');
  pivot_A = wb_robot_get_device('pivot A');
  pivot_B = wb_robot_get_device('pivot B');
  finger_a = wb_robot_get_device('grabber finger A');
  finger_b  = wb_robot_get_device('grabber finger B');
  finger_c  = wb_robot_get_device('grabber finger C');
  DS_L  = wb_robot_get_device('DS_L');
  DS_R  = wb_robot_get_device('DS_R');
  ref  = wb_robot_get_device('ref');
  ref2  = wb_robot_get_device('ref2');
  speed = 3;
  wb_motor_set_velocity(twister,speed);
  wb_motor_set_velocity(pivot_A,speed);
  wb_motor_set_velocity(pivot_B,speed);
  wb_motor_set_velocity(finger_a,speed);
  wb_motor_set_velocity(finger_b,speed);
  wb_motor_set_velocity(finger_c,speed);
  wb_distance_sensor_enable(DS_L,TIME_STEP);
  wb_distance_sensor_enable(DS_R,TIME_STEP);
  wb_distance_sensor_enable(ref,TIME_STEP);
  wb_distance_sensor_enable(ref2,TIME_STEP);

while wb_robot_step(TIME_STEP) ~= -1
Ds=wb_distance_sensor_get_value(DS_R);
dS=wb_distance_sensor_get_value(DS_L);
r=wb_distance_sensor_get_value(ref);
r2=wb_distance_sensor_get_value(ref2);
if Ds < 45 || r<900
wb_robot_step(2000);
wb_motor_set_position(twister,1.57);
wb_robot_step(1000);
wb_motor_set_position(finger_a,1.1);
wb_motor_set_position(finger_b,1.1);
wb_motor_set_position(finger_c,1.1);
wb_robot_step(500);
wb_motor_set_position(pivot_B,1.2);
wb_motor_set_position(pivot_A,0.4);
wb_robot_step(500);
wb_motor_set_position(finger_a,0);
wb_motor_set_position(finger_b,0);
wb_motor_set_position(finger_c,0);
wb_robot_step(1000);
wb_motor_set_position(pivot_A,0);
wb_motor_set_position(pivot_B,0);
wb_motor_set_position(twister,0);
wb_robot_step(1000);
wb_motor_set_position(pivot_A,-0.3);
wb_motor_set_position(pivot_B,0.7);
wb_robot_step(50);
wb_motor_set_position(pivot_A,-0.4);
wb_motor_set_position(pivot_B,1.4);
wb_robot_step(1000);
wb_motor_set_position(finger_a,1.1);
wb_motor_set_position(finger_b,1.1);
wb_motor_set_position(finger_c,1.1);
wb_robot_step(1000);
wb_motor_set_position(pivot_A,0);
wb_motor_set_position(pivot_B,0);
wb_robot_step(100);
end


if dS < 70 || r2<900
wb_robot_step(2000);
wb_motor_set_position(twister,-1.57);
wb_robot_step(1000);
wb_motor_set_position(finger_a,1.1);
wb_motor_set_position(finger_b,1.1);
wb_motor_set_position(finger_c,1.1);
wb_robot_step(500);
wb_motor_set_position(pivot_B,1.2);
wb_motor_set_position(pivot_A,0.4);
wb_robot_step(500);
wb_motor_set_position(finger_a,0);
wb_motor_set_position(finger_b,0);
wb_motor_set_position(finger_c,0);
wb_robot_step(1000);
wb_motor_set_position(pivot_A,0);
wb_motor_set_position(pivot_B,0);
wb_motor_set_position(twister,0);
wb_robot_step(1000);
wb_motor_set_position(pivot_A,-0.3);
wb_motor_set_position(pivot_B,0.7);
wb_robot_step(50);
wb_motor_set_position(pivot_A,-0.4);
wb_motor_set_position(pivot_B,1.4);
wb_robot_step(1000);
wb_motor_set_position(finger_a,1.1);
wb_motor_set_position(finger_b,1.1);
wb_motor_set_position(finger_c,1.1);
wb_robot_step(1000);
wb_motor_set_position(pivot_A,0);
wb_motor_set_position(pivot_B,0);
wb_robot_step(100);
end

  drawnow;
end