function qnb = angle2qua(att)
    
% att=[pitch; roll; yaw] 
    att2 = att/2;
    s = sin(att2); c = cos(att2);
    sp = s(1); sr = s(2); sy = s(3); 
    cp = c(1); cr = c(2); cy = c(3); 
    qnb = [ cp*cr*cy - sp*sr*sy;
            sp*cr*cy - cp*sr*sy;
            cp*sr*cy + sp*cr*sy;
            cp*cr*sy + sp*sr*cy ];