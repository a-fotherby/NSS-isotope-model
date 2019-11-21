load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=0/case1.mat')
depth = 1:l;
depth = depth .* sqrt(2);
depth = depth';
labels = labelGen(record_32, record_33, record_34);
tiledlayout(4,2);
nexttile();
%% Chemical concentration (left most graph).
% Plot data.
plotOutput.depthPlot(record_SO4, depth, labels);
% Format graph.
set(gca,'YDir','reverse', 'YLim',[0 l * dz],'XLim',[0 27],'XAxisLocation','Top');
xlabel(gca, '[SO_4] / mM');
ylabel(gca, 'Depth / cm');
title(gca, 'Sulfate concentration');
nexttile();
plotOutput.depthPlot(outputd34, depth, labels);
% Format graph.
set(gca,'YDir','reverse','XLim',[20,100],'YLim',[0 l * dz], 'XAxisLocation', 'Top');
xlabel(gca, '\delta^{34}S');
ylabel(gca, 'Depth / cm');
title(gca, 'Sulfure isotope composition');
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=0/case2.mat');
labels = labelGen(record_32, record_33, record_34);
nexttile();
%% Chemical concentration (left most graph).
% Plot data.
plotOutput.depthPlot(record_SO4, depth, labels);
% Format graph.
set(gca,'YDir','reverse', 'YLim',[0 l * dz],'XLim',[0 27],'XAxisLocation','Top');
xlabel(gca, '[SO_4] / mM');
ylabel(gca, 'Depth / cm');
title(gca, 'Sulfate concentration');
nexttile();
plotOutput.depthPlot(outputd34, depth, labels);
% Format graph.
set(gca,'YDir','reverse','XLim',[20,100],'YLim',[0 l * dz], 'XAxisLocation', 'Top');
xlabel(gca, '\delta^{34}S');
ylabel(gca, 'Depth / cm');
title(gca, 'Sulfure isotope composition');
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=0/case3.mat');
labels = labelGen(record_32, record_33, record_34);
nexttile();
%% Chemical concentration (left most graph).
% Plot data.
plotOutput.depthPlot(record_SO4, depth, labels);
% Format graph.
set(gca,'YDir','reverse', 'YLim',[0 l * dz],'XLim',[0 27],'XAxisLocation','Top');
xlabel(gca, '[SO_4] / mM');
ylabel(gca, 'Depth / cm');
title(gca, 'Sulfate concentration');
nexttile();
plotOutput.depthPlot(outputd34, depth, labels);
% Format graph.
set(gca,'YDir','reverse','XLim',[20,100],'YLim',[0 l * dz], 'XAxisLocation', 'Top');
xlabel(gca, '\delta^{34}S');
ylabel(gca, 'Depth / cm');
title(gca, 'Sulfure isotope composition');
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=0/case4.mat');
nexttile();
%% Chemical concentration (left most graph).
% Plot data.
plotOutput.depthPlot(record_SO4, depth, labels);
% Format graph.
set(gca,'YDir','reverse', 'YLim',[0 l * dz],'XLim',[0 27],'XAxisLocation','Top');
xlabel(gca, '[SO_4] / mM');
ylabel(gca, 'Depth / cm');
title(gca, 'Sulfate concentration');
% Select axis and plot data.
nexttile();
plotOutput.depthPlot(outputd34, depth, labels);
% Format graph.
set(gca,'YDir','reverse','XLim',[20,100],'YLim',[0 l * dz], 'XAxisLocation', 'Top');
xlabel(gca, '\delta^{34}S');
ylabel(gca, 'Depth / cm');
title(gca, 'Sulfure isotope composition');