clear;
clc;


 
R2D = 180/pi;
D2R = pi/180;

format long;
path = '..\dataset\t\8\UranusData8.csv';  %data_20220505_160203 data_20220505_154004
%data = load(path);
data = csvread(path, 1, 1);
 
acc = data(:,2:4)*9.82;
gyr = data(:,5:7) /57.3;
hz = 400;
dt = 1/hz;
ll = length(gyr);
time = 1:ll;
Imu_qua.q(1) = 1.0;
Imu_qua.q(2) = 0.0;
Imu_qua.q(3) = 0.0;
Imu_qua.q(4) = 0.0;
last_dtha(1) =0.0;
last_dtha(2) =0.0;
last_dtha(3) =0.0;
mean_acc= mean(acc(1:50,:));
yaw0 = 0; %-178.17
Imu_qua.q = acc_init(mean_acc,yaw0);
Imu_qua.gn = [0;0;9.82];
temp_qua=[];
tem_angle = [];
norm_acc_c=[];
ahrs_kf=eskf_init();
out_put.pk=[];
for i=1:ll
  dtha = (gyr(i,:))*dt;
  Imu_qua.acc = acc(i,:)';
  Imu_qua.gyr = gyr(i,:)';
   Imu_qua = track_imu_angle(Imu_qua,dtha,last_dtha); 

   
  ahrs_kf.dt =0.01;
  ahrs_kf = eskf_test(Imu_qua,ahrs_kf);
  Imu_qua = eskf_feedback(Imu_qua,ahrs_kf);
  ahrs_kf.xk(1) = 0.0;ahrs_kf.xk(2) = 0.0;ahrs_kf.xk(3) = 0.0;
  last_dtha = dtha;  
  temp_qua(i,:) = Imu_qua.q;
  tem_angle(i,:) = Imu_qua.angle;
  out_put.pk(1,i) = ahrs_kf.Pxk(1,1);
  out_put.pk(2,i) = ahrs_kf.Pxk(2,2);
  out_put.pk(3,i) = ahrs_kf.Pxk(3,3);
 
  
end


% figure
% subplot(3, 1, 1);
% plot(time(1:end-1)*dt, diff(acc));xlabel('时间/s'),ylabel('acc');
% subplot(3, 1, 2);
% plot(time(1:end-1)*dt-1, diff(gyr));xlabel('时间/s'),ylabel('gyr');
% subplot(3, 1, 3);
% plot(time*dt,out_put.pk()); title('pitch');xlabel('时间/s'),ylabel('P阵');

figure
plot(time*dt,out_put.pk(1:2,:)); title('p');xlabel('时间/s'),ylabel('P阵');

figure
hold on
plot(time*dt,tem_angle(:,1)*R2D); title('pitch');xlabel('时间/s'),ylabel('角度/°');
plot(time*dt,data(:,12));  xlabel('时间/s'),ylabel('角度/°'); 
legend("matlab", "IMU");

figure
hold on
plot(time*dt,tem_angle(:,2)*R2D); title('roll'); xlabel('时间/s'),ylabel('角度/°');
plot(time*dt,data(:,11)); xlabel('时间/s'),ylabel('角度/°');
legend("matlab", "IMU");

figure
hold on
plot(time*dt,tem_angle(:,3)*R2D); title('yaw'); 
plot(time*dt,data(:,13));xlabel('时间/s'),ylabel('角度/°');
legend("matlab", "IMU");

linkaxes

fprintf("yaw  matlab:%.3f   IMU:%.3f\r\n", tem_angle(end,3)*R2D, data(end,13));
% 
% figure
% plot(time*dt,gyr(:,1:3));

figure
plot(time*dt,(acc(:,1:3)));







