%% Plot many steady state crossplot profiles.

figure
hold on

for i = [0 10 14 25 50 100]
    load(sprintf('~/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=%d/case1.mat', i))
    plot(outputd34(:,end), outputd18(:,end), 'DisplayName', sprintf('%.2f%%', (recycling / (recycling + 1)) * 100 ), 'LineWidth', 1);
end

set(gca, 'YLim', [8 22], 'XLim', [20 120]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, {'\delta^{18}O'})
lgd = legend('location', 'southeast');
title(lgd, 'Percentage SO_4 recycled');
axis square

exportgraphics(gca, '/Users/angus/Dropbox/Academic/Isotope Model/Writeup/Figures/steadyStateRecycling.eps', 'ContentType', 'vector');