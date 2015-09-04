function [ret, n, m] = plot_heat(f, lower_limit, upper_limit, isOff)

figure;
colormap('default');
ret = imagesc(f);
[~, ind] = min(f(:));
[m, n] = ind2sub(size(f), ind);
hold on;
%plot(n, m, 'r.', 'MarkerSize',27);
plot([0, 200], [101, 101], 'r-');
plot([101, 101], [0, 200], 'r-');
set(gca,'XTick',[1, 50, 100, 150, 200]);
set(gca,'YTick',[1, 50, 100, 150, 200]);
set(gca,'XtickLabels',[-5, -2.5, 0, 2.5, 5]);
set(gca,'YtickLabels',[-5, -2.5, 0, 2.5, 5]);
colorbar;
xlabel('w_1');
ylabel('w_2');
axis([1, 200, 1, 200]);
caxis([0 0.5])
if isOff == 1
    colorbar('off')
end
axis square
end

