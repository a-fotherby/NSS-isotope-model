load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case1.mat')

depth = 1:l;
depth = depth .* dz;
depth = depth';
tiledlayout(4,2);

nexttile();
%% Chemical concentration (left most graph).
% Plot data.
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(record_SO4, depth, labels);
% Format graph.
set(gca,'YDir','reverse', 'YLim',[0 l * dz],'XLim',[0 27],'XAxisLocation','Top');
xlabel(gca, '[SO_4] / mM');
ylabel(gca, {'Case 1' 'Depth / cm'})
title(gca, 'Sulfate concentration');
legend('off')

nexttile();
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd34, depth, labels);
% Format graph.
set(gca,'YDir','reverse','XLim',[20,100],'YLim',[0 l * dz], 'XAxisLocation', 'Top');
xlabel(gca, '\delta^{34}S');
ylabel(gca, 'Depth / cm');
title(gca, 'Sulfur isotope composition');


load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case2.mat');
nexttile();
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
%% Chemical concentration (left most graph).
% Plot data.
plotOutput.depthPlot(record_SO4, depth, labels);
% Format graph.
set(gca,'YDir','reverse', 'YLim',[0 l * dz],'XLim',[0 27],'XAxisLocation','Top');
xlabel(gca, '[SO_4] / mM');
ylabel(gca, {'Case 2' 'Depth / cm'})
legend('off')


nexttile();
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd34, depth, labels);
% Format graph.
set(gca,'YDir','reverse','XLim',[20 100],'YLim',[0 l * dz], 'XAxisLocation', 'Top');
xlabel(gca, '\delta^{34}S');
ylabel(gca, 'Depth / cm');


load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case3.mat');
nexttile();
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
%% Chemical concentration (left most graph).
% Plot data.
plotOutput.depthPlot(record_SO4, depth, labels);
% Format graph.
set(gca,'YDir','reverse', 'YLim',[0 l * dz],'XLim',[0 27],'XAxisLocation','Top');
xlabel(gca, '[SO_4] / mM');
ylabel(gca, {'Case 3' 'Depth / cm'})
legend('off')


nexttile();
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd34, depth, labels);
% Format graph.
set(gca,'YDir','reverse','XLim',[20,100],'YLim',[0 l * dz], 'XAxisLocation', 'Top');
xlabel(gca, '\delta^{34}S');
ylabel(gca, 'Depth / cm');


load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case4.mat');
nexttile();
%% Chemical concentration (left most graph).
% Plot data.
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(record_SO4, depth, labels);
% Format graph.
set(gca,'YDir','reverse', 'YLim',[0 l * dz],'XLim',[0 27],'XAxisLocation','Top');
xlabel(gca, '[SO_4] / mM');
ylabel(gca, {'Case 4' 'Depth / cm'})
legend('off')

% Select axis and plot data.

nexttile();
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd34, depth, labels);
% Format graph.
set(gca,'YDir','reverse','XLim',[20,100],'YLim',[0 l * dz], 'XAxisLocation', 'Top');
xlabel(gca, '\delta^{34}S');
ylabel(gca, 'Depth / cm');
