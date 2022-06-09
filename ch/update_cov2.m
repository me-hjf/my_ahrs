function ahrs_kf =  update_cov2(imu_qua,ahrs_kf0)
   ahrs_kf = ahrs_kf0;
   temp_p = ahrs_kf0.Pxk;
   Fk = zeros(3,3);
   Ftk = Fk*ahrs_kf0.dt;
   Ftk = Ftk + eye(3);
   
   %err_cross =0.00000;
   err_kk = 0.0001;
  % dtha_n = imu_qua.Rnb*imu_qua.dtha;
  dtha_n = imu_qua.dtha;

 %  cross_imun=[0;0;0];
%    cross_imun(1) =  dtha_n(2)^2 + dtha_n(3)^2;
%    cross_imun(2) =  dtha_n(1)^2 + dtha_n(3)^2;
%    cross_imun(3) =  dtha_n(1)^2 + dtha_n(2)^2;
 %  Q_imu = dtha_n.^2*err_kk;
   %ahrs_kf.Q_imu = Q_imu*0.05+ahrs_kf.Q_imu*0.95;
  % ahrs_kf.Q_imu = Q_imu;

   mat_Q = diag(dtha_n.^2*err_kk);
   
   temp_p = Ftk*temp_p*Ftk + ahrs_kf0.Qt+mat_Q*1;
   
   ahrs_kf.Pxk = temp_p;
   
   
end