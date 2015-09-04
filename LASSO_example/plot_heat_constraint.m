function ret = plot_heat_constraint(f, lower_limit, upper_limit, isOff, constraint, min1, min2)

figure;
colormap('default');
ret = imagesc(f);
[~, ind] = min(f(:));
[m, n] = ind2sub(size(f), ind);
hold on;
%plot(n, m, '.', 'MarkerFaceColor', [0.8, 0.8, 0.8], 'MarkerSize',27);
plot([0, 200], [101, 101], 'r-');
plot([101, 101], [0, 200], 'r-');
set(gca,'XTick',[1, 50, 100, 150, 200]);
set(gca,'YTick',[1, 50, 100, 150, 200]);
set(gca,'XtickLabels',[-5, -2.5, 0, 2.5, 5]);
set(gca,'YtickLabels',[-5, -2.5, 0, 2.5, 5]);
colorbar;
xlabel('w_1');
ylabel('w_2');

caxis([0 6])
if isOff == 1
    colorbar('off')
end
%colormap('gray');
ret = imagesc(ones(size(f))*10);
set(ret, 'AlphaData', 0.65*constraint);

plot(min1, min2, 'r.', 'MarkerSize',27);
axis([30, 170, 30, 170]);
axis square
end

