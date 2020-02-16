tiledlayout(4,2);

load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case1.mat')

depth = 1:l;
depth = depth .* sqrt(2);
depth = depth';

nexttile()
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd18, depth, labels);
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O');
ylabel(gca, {'Case 1' 'Depth / cm'});
title(gca, 'Recycling = 0');
legend('off')

nexttile();
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=10/case1.mat');
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O');
ylabel(gca, 'Depth / cm');
title(gca, 'Recycling = 10');

nexttile();
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case2.mat');
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O');
ylabel(gca, {'Case 2' 'Depth / cm'})
legend('off')

nexttile();
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=10/case2.mat');
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit)
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O');
ylabel(gca, 'Depth / cm');

nexttile();
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case3.mat');
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit)
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O');
ylabel(gca, {'Case 3' 'Depth / cm'})
legend('off')

nexttile();
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=10/case3.mat');
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit)
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O');
ylabel(gca, 'Depth / cm');


nexttile();
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case4.mat');
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit)
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O');
ylabel(gca, {'Case 4' 'Depth / cm'})
legend('off')

nexttile();
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=10/case4.mat');
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit)
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O');
ylabel(gca, 'Depth / cm');