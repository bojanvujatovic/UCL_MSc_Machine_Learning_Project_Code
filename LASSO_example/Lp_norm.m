function ret = Lp_norm(w, p)

ret = sum(abs(w).^p)^(1/p);

end

