t = tiledlayout(2, 4, 'TileSpacing', 'none', 'Padding', 'none');

load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case1.mat')

ylabel(t, 'Depth (cm)')
title(t, '\delta^{18}O (‰)')

depth = 1:l;
depth = depth .* dz;
depth = depth';

nexttile()
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd18, depth, labels);
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
ylabel(gca, 'Recycling = 0', 'FontWeight', 'bold');
title(gca, {'Case 1'})
text(0, 0, '(a)');
legend('off')
pbaspect([1 2 1])

nexttile(5);
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=14/case1.mat');
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 22],'XAxisLocation','Top');
ylabel(gca, 'Recycling = 14', 'FontWeight', 'bold');
text(0, 0, '(e)');
legend('off')
pbaspect([1 2 1])

nexttile(2);
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case2.mat');
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
title(gca, {'Case 2'})
text(0, 0, '(b)');
legend('off')
pbaspect([1 2 1])

nexttile(6);
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=14/case2.mat');
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 22],'XAxisLocation','Top');
text(0, 0, '(f)');
legend('off')
pbaspect([1 2 1])

nexttile(3);
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case3.mat');
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit)
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
title(gca, {'Case 3'})
text(0, 0, '(c)');
legend('off')
pbaspect([1 2 1])

nexttile(7);
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=14/case3.mat');
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 22],'XAxisLocation','Top');
text(0, 0, '(g)');
legend('off')
pbaspect([1 2 1])

nexttile(4);
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case4.mat');
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit);
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
title(gca, 'Case 4')
text(0, 0, '(d)');
legend('off')
pbaspect([1 2 1])

nexttile(8);
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=14/case4.mat');
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit)
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 22],'XAxisLocation','Top');
text(0, 0, '(h)');
legend('off')
pbaspect([1 2 1])

exportgraphics(t, '/Users/angus/Dropbox/Academic/Isotope Model/Writeup/Figures/oxygenComposition.eps', 'ContentType', 'vector');