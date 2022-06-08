function att = qua2angle(qnb)

% Output: att - Euler angles att=[pitch; roll; yaw] in radians

%  q11 = qnb(1)*qnb(1); q12 = qnb(1)*qnb(2); q13 = qnb(1)*qnb(3); q14 = qnb(1)*qnb(4); 
%     q22 = qnb(2)*qnb(2); q23 = qnb(2)*qnb(3); q24 = qnb(2)*qnb(4);     
%     q33 = qnb(3)*qnb(3); q34 = qnb(3)*qnb(4);  
%     q44 = qnb(4)*qnb(4);
%     C12=2*(q23-q14);
%     C22=q11-q22+q33-q44;
%     C31=2*(q24-q13); C32=2*(q34+q12); C33=q11-q22-q33+q44;
%     att = [ asin(C32); 
%             atan2(-C31,C33); 
%             atan2(-C12,C22) ];
        
q0 = qnb(1);
q1 = qnb(2);
q2 = qnb(3);
q3 = qnb(4);

% 
% roll =  -atan2( 2*( q1*q3 - q0*q2 ) , q0*q0 - q1*q1 - q2*q2 + q3*q3);
% pitch = asin( 2*(q0*q1 + q2*q3) );
% yaw = -atan2(2*( q1*q2 - q0*q3 ), q0*q0 - q1*q1 + q2*q2 - q3*q3);

roll =  atan2( 2*( q0*q1 + q2*q3 ) , 1 - 2*q1*q1 - 2*q2*q2);
    pitch = asin( 2*(q0*q2 - q1*q3) );
    yaw = atan2(2*( q0*q3 + q1*q2 ), 1 - 2*q2*q2 - 2*q3*q3);

att = [pitch; roll; yaw];        
        


end