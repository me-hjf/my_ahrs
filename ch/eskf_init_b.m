function ahrs_kf = eskf_init_b()

err_g = 0.001;
kf.Qt = diag([err_g;err_g;err_g])*0.0005; %0.001
kf.Pxk = diag([err_g;err_g;err_g])*100;
kf.xk = zeros(3,1);
kf.dt =0.01;
kf.exacc = [0;0;0];
ahrs_kf = kf;
ahrs_kf.bad_acc = 0;
ahrs_kf.good_acc = 0;
ahrs_kf.bad_accx=0;
ahrs_kf.bad_accy=0;
ahrs_kf.bad_accz=0;
ahrs_kf.innov_acc_n = [0;0;0];
ahrs_kf.innov_acc_b = [0;0;0];
ahrs_kf.extern_acc_b = [0;0;0];

end
