% pers = 10:15:100;
% 
% lasso_train = load('results/phenotype10/lasso-learning-train');
% lasso_train = lasso_train(:, 2);
% 
% lasso_test = load('results/phenotype10/lasso-learning-test');
% lasso_test = lasso_test(:, 2);
% 
% 
% elasticnet_train = load('results/phenotype10/elasticnet-learning-train');
% elasticnet_train = elasticnet_train(:, 2);
% 
% elasticnet_test = load('results/phenotype10/elasticnet-learning-test');
% elasticnet_test = elasticnet_test(:, 2);
% 
% 
% fusion_train = load('results/phenotype10/fusion-learning-train');
% fusion_train = fusion_train(:, 2);
% 
% fusion_test = load('results/phenotype10/fusion-learning-test');
% fusion_test = fusion_test(:, 2);
% 
% 
% elasticnetfusion_train = load('results/phenotype10/elasticnetfusion-learning-train');
% elasticnetfusion_train = elasticnetfusion_train(:, 2);
% 
% elasticnetfusion_test = load('results/phenotype10/elasticnetfusion-learning-test');
% elasticnetfusion_test = elasticnetfusion_test(:, 2);
% 
% figure;
% hold on;
% xlim([10, 100]);
% plot(pers, lasso_test, 'r-');
% plot(pers, elasticnet_test, 'b-');
% plot(pers, fusion_test, 'g-');
% plot(pers, elasticnetfusion_test, 'm-');
% 
% legend('l_1', 'l_1 + l_2', 'l_1 + fusion', 'l_1 + l_2 + fusion');
% 
% xlabel('Percentage of training set used');
% ylabel('Accuracy on test set');
% 
% figure;
% hold on;
% xlim([10, 100]);
% plot(pers, lasso_train, 'r-');
% plot(pers, elasticnet_train, 'b-');
% plot(pers, fusion_train, 'g-');
% plot(pers, elasticnetfusion_train, 'm-');
% 
% legend('l_1', 'l_1 + l_2', 'l_1 + fusion', 'l_1 + l_2 + fusion');
% 
% xlabel('Percentage of training set used');
% ylabel('Accuracy on train set');


% pers = 10:15:100;
% 
% lasso_train = load('results/phenotype1000/lasso-learning-train');
% lasso_train = lasso_train(:, 2);
% 
% lasso_test = load('results/phenotype1000/lasso-learning-test');
% lasso_test = lasso_test(:, 2);
% 
% 
% elasticnet_train = load('results/phenotype1000/elasticnet-learning-train');
% elasticnet_train = elasticnet_train(:, 2);
% 
% elasticnet_test = load('results/phenotype1000/elasticnet-learning-test');
% elasticnet_test = elasticnet_test(:, 2);
% 
% 
% fusion_train = load('results/phenotype1000/fusion-learning-train');
% fusion_train = fusion_train(:, 2);
% 
% fusion_test = load('results/phenotype1000/fusion-learning-test');
% fusion_test = fusion_test(:, 2);
% 
% 
% elasticnetfusion_train = load('results/phenotype1000/elasticnetfusion-learning-train');
% elasticnetfusion_train = elasticnetfusion_train(:, 2);
% 
% elasticnetfusion_test = load('results/phenotype1000/elasticnetfusion-learning-test');
% elasticnetfusion_test = elasticnetfusion_test(:, 2);
% 
% figure;
% hold on;
% xlim([10, 100]);
% plot(pers, lasso_test, 'r-');
% plot(pers, elasticnet_test, 'b-');
% plot(pers, fusion_test, 'g-');
% plot(pers, elasticnetfusion_test, 'm-');
% 
% legend('l_1', 'l_1 + l_2', 'l_1 + fusion', 'l_1 + l_2 + fusion');
% 
% xlabel('Percentage of training set used');
% ylabel('Accuracy on test set');
% 
% figure;
% hold on;
% xlim([10, 100]);
% plot(pers, lasso_train, 'r-');
% plot(pers, elasticnet_train, 'b-');
% plot(pers, fusion_train, 'g-');
% plot(pers, elasticnetfusion_train, 'm-');
% 
% legend('l_1', 'l_1 + l_2', 'l_1 + fusion', 'l_1 + l_2 + fusion');
% 
% xlabel('Percentage of training set used');
% ylabel('Accuracy on train set');

% pers = 10:15:100;
% 
% lasso_train = load('results/phenotypeSex/lasso-learning-train');
% lasso_train = lasso_train(:, 2);
% 
% lasso_test = load('results/phenotypeSex/lasso-learning-test');
% lasso_test = lasso_test(:, 2);
% 
% 
% elasticnet_train = load('results/phenotypeSex/elasticnet-learning-train');
% elasticnet_train = elasticnet_train(:, 2);
% 
% elasticnet_test = load('results/phenotypeSex/elasticnet-learning-test');
% elasticnet_test = elasticnet_test(:, 2);
% 
% 
% fusion_train = load('results/phenotypeSex/fusion-learning-train');
% fusion_train = fusion_train(:, 2);
% 
% fusion_test = load('results/phenotypeSex/fusion-learning-test');
% fusion_test = fusion_test(:, 2);
% 
% 
% elasticnetfusion_train = load('results/phenotypeSex/elasticnetfusion-learning-train');
% elasticnetfusion_train = elasticnetfusion_train(:, 2);
% 
% elasticnetfusion_test = load('results/phenotypeSex/elasticnetfusion-learning-test');
% elasticnetfusion_test = elasticnetfusion_test(:, 2);
% 
% figure;
% hold on;
% xlim([10, 100]);
% plot(pers, lasso_test, 'r-');
% plot(pers, elasticnet_test, 'b-');
% plot(pers, fusion_test, 'g-');
% plot(pers, elasticnetfusion_test, 'm-');
% 
% legend('l_1', 'l_1 + l_2', 'l_1 + fusion', 'l_1 + l_2 + fusion');
% 
% xlabel('Percentage of training set used');
% ylabel('Accuracy on test set');
% 
% figure;
% hold on;
% xlim([10, 100]);
% plot(pers, lasso_train, 'r-');
% plot(pers, elasticnet_train, 'b-');
% plot(pers, fusion_train, 'g-');
% plot(pers, elasticnetfusion_train, 'm-');
% 
% legend('l_1', 'l_1 + l_2', 'l_1 + fusion', 'l_1 + l_2 + fusion');
% 
% xlabel('Percentage of training set used');
% ylabel('Accuracy on train set');

pers = 10:15:100;

% lasso_train = load('results/phenotype1000/lasso-learning-F1');
% lasso_train = lasso_train(:, 2);
% 
% 
% elasticnet_train = load('results/phenotype1000/elasticnet-learning-F1');
% elasticnet_train = elasticnet_train(:, 2);
% 
% 
% fusion_train = load('results/phenotype1000/fusion-learning-F1');
% fusion_train = fusion_train(:, 2);
% 
% 
% elasticnetfusion_train = load('results/phenotype1000/elasticnetfusion-learning-F1');
% elasticnetfusion_train = elasticnetfusion_train(:, 2);

figure;
hold on;
xlim([10, 100]);
plot(pers, 10*lasso_train, 'r-');
plot(pers, 10*elasticnet_train, 'b-');
plot(pers, 10*fusion_train, 'g-');
plot(pers, 10*elasticnetfusion_train, 'm-');

legend('l_1', 'l_1 + l_2', 'l_1 + fusion', 'l_1 + l_2 + fusion');

xlabel('Percentage of training set used');
ylabel('F1 measure of feature selection');
