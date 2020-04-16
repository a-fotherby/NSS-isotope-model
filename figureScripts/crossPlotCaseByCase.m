t = tiledlayout(2, 4, 'TileSpacing', 'compact', 'Padding', 'compact');
xlabel(t, '\delta^{34}S')
ylabel(t, '\delta^{18}O')

load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case1.mat')

depth = 1:l;
depth = depth .* dz;
depth = depth';

nexttile(1)
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit); 
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 80]);
ylabel(gca, 'Recycling = 0', 'FontWeight', 'bold');
title('Case 1')
legend('off')
axis square

nexttile(5)
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=14/case1.mat')
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit); 
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 120]);
ylabel(gca, 'Recycling = 14', 'FontWeight', 'bold');
legend('off')
axis square

nexttile(2)
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case2.mat')
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit); 
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 80]);
title('Case 2');
legend('off')
axis square


nexttile(6)
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=14/case2.mat')
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit); 
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 120]);
legend('off')
axis square



nexttile(3)
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case3.mat')
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit); 
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 80]);
title('Case 3');
legend('off')
axis square



nexttile(7)
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=14/case3.mat')
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit); 
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 120]);
legend('off')
axis square

nexttile(4)
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case4.mat')
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit); 
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 80]);
title('Case 46');
legend('off')
axis square


nexttile(8)
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=14/case4.mat')
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit); 
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 120]);
legend('off')
axis square

exportgraphics(t, '/Users/angus/Dropbox/Academic/Isotope Model/Writeup/Figures/crossplots.eps', 'ContentType', 'vector');