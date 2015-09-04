function ret = Elastic_net(w)

ret = Lp_norm(w, 1) + 0.5*Lp_norm(w, 2)^2;

end

