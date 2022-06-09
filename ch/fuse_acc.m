function ahrs_kf = fuse_acc(imu_qua,ahrs_kf0)
  
  fn(1) =0;
  fn(2) =0;
  fn(3) = 9.82;
  tmp_acc = imu_qua.acc;
  innov_acc1 = imu_qua.Rnb*(tmp_acc)-fn;
  
  innov_acc = [0;0];
  innov_acc(1) = innov_acc1(1);
  innov_acc(2) = innov_acc1(2);
  
  H = symm(fn);
  H_acc = H(1:2,:);

  rk =0.1;
  Rk=diag([1;1])*rk;

  if(norm(imu_qua.acc)>10.05||norm(imu_qua.acc)<9.75||norm(imu_qua.gyr)>deg2rad(3.4))
      Rk = Rk*1500;
  end    

  
  Kk = ahrs_kf0.Pxk*H_acc'*inv(H_acc*ahrs_kf0.Pxk*H_acc'+Rk);
  ahrs_kf0.xk = ahrs_kf0.xk + Kk*innov_acc; 
  ahrs_kf0.Pxk = (eye(3)-Kk*H_acc)*ahrs_kf0.Pxk;
  ahrs_kf = ahrs_kf0;
end
