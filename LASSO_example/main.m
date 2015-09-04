X = [
  1, 2;
  1, -2;
  1, 1.5;
  -1 -1;
  -1, -2;
  -1, 0.5;
  -1, 0.8;
  1, 1
];

y = [
  1;
  1;
  1;
  -1;
  -1;
  -1;
  -1;
  -1
];

[N, d] = size(X);

upper_limit = 5;
lower_limit = -5;
distance = 0.05;

range_w = lower_limit:distance:upper_limit;
N_w = length(range_w);

[w1, w2] = meshgrid(range_w, range_w);
error = zeros(size(w1));
regularisation = zeros(size(w1));
regularisation110 = zeros(size(w1));
regularisation12 = zeros(size(w1));
regularisation2 = zeros(size(w1));

fused =  zeros(size(w1));
elastic =  zeros(size(w1));

laplace =  zeros(size(w1));
ARD =  zeros(size(w1));
RVM =  zeros(size(w1));

for i = 1:N_w
    for j = 1:N_w
        w = [w1(i, j); w2(i, j)];
        
        error(i, j) = logistic_error(y, X, w);
        regularisation(i, j) = Lp_norm(w, 1);
        regularisation110(i, j) = Lp_norm(w, 1/3);
        regularisation12(i, j) = Lp_norm(w, 1/2);
        regularisation2(i, j) = Lp_norm(w, 2);
        
        fused(i,j) = Fused_LASSO(w);
        elastic(i,j) = Elastic_net(w);
        
        laplace(i, j) = exp(-2*abs(w(1))) * exp(-2*abs(w(2)))*2;
        ARD(i, j) = normpdf(w(1),0,2) * normpdf(w(2),0,1/2)*3;
        RVM(i, j) = tpdf(w(1), 3) * tpdf(w(2), 3) * 5;
    end
end

% [fig1, min11, min12] = plot_heat(error, lower_limit, upper_limit, 1);
% 
% [fig1, min21, min22] = plot_heat(regularisation, lower_limit, upper_limit, 1);
% 
% [fig1, min31, min32] = plot_heat(error + 0.1 * regularisation, lower_limit, upper_limit, 0);
% 
% plot_heat_constraint(error, lower_limit, upper_limit, 0, regularisation > 1.3, min31, min32);
% 
% plot_heat_constraint(error, lower_limit, upper_limit, 1, regularisation110 > 1.3, min31, min32);
% plot_heat_constraint(error, lower_limit, upper_limit, 1, regularisation12 > 1.3, min31, min32);
% plot_heat_constraint(error, lower_limit, upper_limit, 0, regularisation2 > 1.3, min11-18, min12+2);


% plot_heat(fused, lower_limit, upper_limit, 1);
% plot_heat(elastic, lower_limit, upper_limit, 1);

plot_heat(laplace, lower_limit, upper_limit, 1);
plot_heat(ARD, lower_limit, upper_limit, 1);
plot_heat(RVM, lower_limit, upper_limit, 0);

%pause;
%close all;