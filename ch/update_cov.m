function ahrs_kf =  update_cov(ahrs_kf0)
   ahrs_kf = ahrs_kf0;
   temp_p = ahrs_kf0.Pxk;
   Fk = zeros(3,3);
   Ftk = Fk*ahrs_kf0.dt;
   Ftk = Ftk + eye(3);
   temp_p = Ftk*temp_p*Ftk + ahrs_kf0.Qt;
   ahrs_kf.Pxk = temp_p;
   
end