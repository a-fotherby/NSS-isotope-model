load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case1.mat')

depth = 1:l;
depth = depth .* dz;
depth = depth';
t = tiledlayout(1, 4,'TileSpacing', 'compact', 'Padding', 'none');

title(t, '[SO_4] (mM)');
ylabel(t, 'Depth (cm)');

nexttile();
%% Chemical concentration (left most graph).
% Plot data.
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(record_SO4, depth, labels);
% Format graph.
set(gca,'YDir','reverse', 'YLim',[0 l * dz],'XLim',[0 27],'XAxisLocation','Top');
legend('off')
pbaspect([1 2 1])

load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case2.mat');
nexttile(2);
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
%% Chemical concentration (left most graph).
% Plot data.
plotOutput.depthPlot(record_SO4, depth, labels);
% Format graph.
set(gca,'YDir','reverse', 'YLim',[0 l * dz],'XLim',[0 27],'XAxisLocation','Top');
legend('off')
pbaspect([1 2 1])

load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case3.mat');
nexttile(3);
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
%% Chemical concentration (left most graph).
% Plot data.
plotOutput.depthPlot(record_SO4, depth, labels);
% Format graph.
set(gca,'YDir','reverse', 'YLim',[0 l * dz],'XLim',[0 27],'XAxisLocation','Top');
legend('off')
pbaspect([1 2 1])

load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case4.mat');
nexttile(4);
%% Chemical concentration (left most graph).
% Plot data.
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(record_SO4, depth, labels);
% Format graph.
set(gca,'YDir','reverse', 'YLim',[0 l * dz],'XLim',[0 27],'XAxisLocation','Top');
legend('off')
pbaspect([1 2 1])

exportgraphics(t, '/Users/angus/Dropbox/Academic/Isotope Model/Writeup/Figures/sulfateConcentration.eps', 'ContentType', 'vector');