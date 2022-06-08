function imu_qua = eskf_feedback(imu_qua0,ahrs_kf0)
 imu_qua = imu_qua0;
 err_qua = [1 ahrs_kf0.xk(1)*0.5 ahrs_kf0.xk(2)*0.5 ahrs_kf0.xk(3)*0.5];
 tmp_q = qmulq(err_qua,imu_qua0.q);
 imu_qua.q = normlized_q(tmp_q);
 imu_qua.angle = qua2angle(imu_qua.q);
 imu_qua.Rnb = qua2dcm(imu_qua.q);
 ahrs_kf0.exacc = imu_qua0.Rnb'*imu_qua.gn-imu_qua.acc;
end
