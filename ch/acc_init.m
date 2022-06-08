function init_q = acc_init(static_acc,init_yaw)
 norm_acc = sqrt(static_acc(1)^2+static_acc(2)^2+static_acc(3)^2);
 pitch = asin(static_acc(2)/norm_acc);
 roll =0.0;
 yaw =init_yaw/57.3;
 if(abs(pitch)<45/57.3)
  roll =   atan2(-static_acc(1),static_acc(3)); 
  atti(1) = pitch;
  atti(2) = roll;
  atti(3) = yaw;
  init_q = angle2qua(atti);
 else
  roll = asin(-static_acc(1) / norm_acc);
  pitch = atan2(static_acc(2), static_acc(3));   
  
  atti(1) = pitch;
  atti(2) = roll;
  atti(3) = yaw;
  init_q = angle2qua2(atti);
 end
 init_q = normlized_q(init_q);

end