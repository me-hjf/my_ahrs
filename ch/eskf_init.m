function ahrs_kf = eskf_init()

err_g = 0.000001; %0.001
kf.Qt = diag([err_g;err_g;err_g]);  %0.03
kf.Pxk = diag([err_g;err_g;err_g])*10000;
kf.xk = zeros(3,1);
kf.dt =0.01;
kf.exacc = [0;0;0];
ahrs_kf = kf;
ahrs_kf.bad_acc = 0;
ahrs_kf.good_acc = 0;
ahrs_kf.bad_accx=0;
ahrs_kf.bad_accy=0;
ahrs_kf.bad_accz=0;
ahrs_kf.Q_imu = [0;0;0];
end
