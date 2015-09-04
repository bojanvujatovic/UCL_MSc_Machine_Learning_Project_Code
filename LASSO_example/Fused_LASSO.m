function ret = Fused_LASSO(w)

ret = Lp_norm(w, 1) + 0.8*abs(w(1) - w(2));

end

