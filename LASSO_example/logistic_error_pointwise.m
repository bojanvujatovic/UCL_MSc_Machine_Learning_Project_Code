function ret = logistic_error_pointwise(y, x, w)

ret = log(1 + exp(-y * w'*x));

end

