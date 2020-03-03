t = tiledlayout(4,2);

load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case1.mat')

depth = 1:l;
depth = depth .* dz;
depth = depth';

nexttile()
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case1.mat')
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit); 
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 80]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, {'Case 1' '\delta^{18}O'})
title('Recycling = 0')
legend('off')
axis square

nexttile()
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=14/case1.mat')
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit); 
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 120]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, '\delta^{18}O')
title('Recyling = 14')
axis square


nexttile()
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case2.mat')
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit); 
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 80]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, {'Case 2' '\delta^{18}O'})
legend('off')
axis square


nexttile()
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=14/case2.mat')
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit); 
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 120]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, '\delta^{18}O')
axis square



nexttile()
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case3.mat')
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit); 
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 80]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, {'Case 3' '\delta^{18}O'})
legend('off')
axis square



nexttile()
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=14/case3.mat')
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit); 
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 120]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, '\delta^{18}O')
axis square


nexttile()
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=0/case4.mat')
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit); 
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 80]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, {'Case 4' '\delta^{18}O'})
legend('off')
axis square


nexttile()
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/pProgressRecorded/rec=14/case4.mat')
labels = labelGen.percentageProgress(initRMSSO4, record_RMS, steadyStateLimit); 
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 120]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, '\delta^{18}O')
axis square