function ret = logistic_error(y, X, w)

ret = 0;
N = length(y);

for i = 1:N
    ret = ret + 1/N * logistic_error_pointwise(y(i), X(i, :)', w);
end

end

