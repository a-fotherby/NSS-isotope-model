load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case1.mat')

depth = 1:l;
depth = depth .* dz;
depth = depth';
t = tiledlayout(1, 4, 'TileSpacing', 'none', 'Padding', 'none');
ylabel(t, 'Depth (cm)');
title(t, '\delta^{34}S');

nexttile();
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd34, depth, labels);
% Format graph.
set(gca,'YDir','reverse','XLim',[20,100],'YLim',[0 l * dz], 'XAxisLocation', 'Top');
text(0, 0, '(a)');
legend('off')
pbaspect([1 2 1])

load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case2.mat')
nexttile();
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd34, depth, labels);
% Format graph.
set(gca,'YDir','reverse','XLim',[20 100],'YLim',[0 l * dz], 'XAxisLocation', 'Top');
text(0, 0, '(b)');
legend('off')
pbaspect([1 2 1])

load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case3.mat')
nexttile();
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd34, depth, labels);
% Format graph.
set(gca,'YDir','reverse','XLim',[20,100],'YLim',[0 l * dz], 'XAxisLocation', 'Top');
text(0, 0, '(c)');
legend('off')
pbaspect([1 2 1])

load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case4.mat')
nexttile();
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd34, depth, labels);
% Format graph.
set(gca,'YDir','reverse','XLim',[20,100],'YLim',[0 l * dz], 'XAxisLocation', 'Top');
text(0, 0, '(d)');
legend('off')
pbaspect([1 2 1])

exportgraphics(t, '/Users/angus/Dropbox/Academic/Isotope Model/Writeup/Figures/sulfateComposition.eps', 'ContentType', 'vector');