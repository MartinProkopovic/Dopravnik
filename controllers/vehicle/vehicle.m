
TIME_STEP = 64;
p=-1;
t=0;
f=0;
motor_l = wb_robot_get_device('motor_left');
motor_r = wb_robot_get_device('motor_right');
 c = wb_robot_get_device('dsc');
 Dvs = wb_robot_get_device('Dv');
  wb_distance_sensor_enable(c,TIME_STEP);
  wb_distance_sensor_enable(Dvs,TIME_STEP);
wb_motor_set_velocity(motor_l,6);
  wb_motor_set_velocity(motor_r,6);
while wb_robot_step(TIME_STEP) ~= -1
D=wb_distance_sensor_get_value(c);
E=wb_distance_sensor_get_value(Dvs);

if E < 1000
f = 1;
t = 0;
end

if f==1 & t==0
wb_motor_set_position(motor_l, p);
wb_motor_set_position(motor_r, p);
wb_robot_step(100);
p= p-1;
D = wb_distance_sensor_get_value(c); 

if D < 70
t = 1;

end

end

if D < 70 & t==1
wb_motor_set_position(motor_l,0);
wb_motor_set_position(motor_r,0); 
p=-1;
f=0;
end
  drawnow;

end