function q = normlized_q(in_q)
 norm_q = sqrt(in_q(1)^2+in_q(2)^2+in_q(3)^2+in_q(4)^2);
 q = in_q/norm_q;
end