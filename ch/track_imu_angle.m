function imu_qua = track_imu_angle(imu_qua0,dtha,last_dtha)
    
    imu_qua = imu_qua0;
    dphim = dtha + 1/12*cross(last_dtha,dtha);
    dphim2 = dphim(1)*dphim(1) + dphim(2)*dphim(2) + dphim(3)*dphim(3);
    norm_dphim = sqrt(dphim2);
    dq12 = zeros(4,1);
    if norm_dphim<1.0e-5
      dq12(1) = 1-dphim2*(1/8-dphim2/384); 
      s_dphim = 1/2-dphim2*(1/48-dphim2/3840);
    else
      s_dphim = sin(norm_dphim/2)/norm_dphim;
      dq12(1) = cos(norm_dphim/2);
    end
    dq12(2) = s_dphim* dphim(1);
    dq12(3) = s_dphim* dphim(2);
    dq12(4) = s_dphim* dphim(3);
    
    imu_qua.q = qmulq(imu_qua0.q,dq12);
    imu_qua.q = normlized_q(imu_qua.q);
    imu_qua.dtha = dtha';
    imu_qua.angle = qua2angle(imu_qua.q);
    imu_qua.Rnb = qua2dcm(imu_qua.q);
    
end
