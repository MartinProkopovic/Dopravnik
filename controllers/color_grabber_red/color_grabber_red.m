TIME_STEP = 64;
m = 0;
  pc=0;
TW = wb_robot_get_device('tw');
finger_1 = wb_robot_get_device('grabber finger A');
finger_2  = wb_robot_get_device('grabber finger B');
finger_3  = wb_robot_get_device('grabber finger C');
pivot_1 = wb_robot_get_device('pivot1');
pivot_2 = wb_robot_get_device('pivot2');
D_R = wb_robot_get_device('red');
speed = 3;
 wb_motor_set_velocity(TW,speed);
 wb_motor_set_velocity(finger_1,speed);
 wb_motor_set_velocity(finger_2,speed);
 wb_motor_set_velocity(finger_3,speed);
 wb_motor_set_velocity(pivot_1,speed);
 wb_motor_set_velocity(pivot_2,speed);
 wb_distance_sensor_enable(D_R,TIME_STEP);
 
while wb_robot_step(TIME_STEP) ~= -1
if m==0
wb_motor_set_position(TW,1.57)
wb_motor_set_position(finger_1,1.3);
wb_motor_set_position(finger_2,1.3);
wb_motor_set_position(finger_3,1.3);
wb_motor_set_position(pivot_2,1);
wb_motor_set_position(pivot_1,-0.5);
wb_robot_step(500);
Sens = wb_distance_sensor_get_value(D_R);
end
while wb_robot_step(m==0)
Sens = wb_distance_sensor_get_value(D_R);
if 1000 > Sens && Sens > 450
m = 1;
end
end
if m == 1
wb_robot_step(920);
wb_motor_set_position(pivot_2, 1.3);
wb_motor_set_position(pivot_1, 0.1);
wb_robot_step(300);
wb_motor_set_position(finger_1,0.2);
wb_motor_set_position(finger_2,0.2);
wb_motor_set_position(finger_3,0.2);
wb_robot_step(500);
wb_motor_set_position(pivot_2,-0.3);
wb_motor_set_position(pivot_1,-0.3);
wb_robot_step(500);
wb_motor_set_position(TW,-1.57);
wb_robot_step(500);
wb_motor_set_position(pivot_2,1.1);
wb_robot_step(500);
wb_motor_set_position(finger_1,1);
wb_motor_set_position(finger_2,1);
wb_motor_set_position(finger_3,1);
wb_robot_step(500);
m = 0;
pc=pc+1;
disp("Počet červených kociek "+pc);
end
  drawnow;
end