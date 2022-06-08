function imu_qua = track_imu_angle2(imu_qua0,dtha)
   imu_qua = imu_qua0;
  temp_q(1) = imu_qua0.q(1) + 0.5*(-dtha(1)*imu_qua0.q(2)-dtha(2)*imu_qua0.q(3)-dtha(3)*imu_qua0.q(4));
  temp_q(2) = imu_qua0.q(2) + 0.5*(dtha(1)*imu_qua0.q(1)-dtha(2)*imu_qua0.q(4)+dtha(3)*imu_qua0.q(3));
  temp_q(3) = imu_qua0.q(3) + 0.5*(dtha(2)*imu_qua0.q(1)-dtha(3)*imu_qua0.q(2)+dtha(1)*imu_qua0.q(4));
  temp_q(4) = imu_qua0.q(4) + 0.5*(dtha(3)*imu_qua0.q(1)-dtha(1)*imu_qua0.q(3)+dtha(2)*imu_qua0.q(2));
  imu_qua.q = normlized_q(temp_q);

    imu_qua.angle = qua2angle(imu_qua.q);
    imu_qua.Rnb = qua2dcm(imu_qua.q);
    imu_qua.dtha = dtha';
end