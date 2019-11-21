tiledlayout(4,2);

load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=0/case1.mat')

depth = 1:l;
depth = depth .* sqrt(2);
depth = depth';

nexttile()
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=0/case1.mat')
labels = labelGen(record_32, record_33, record_34);
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 80]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, '\delta^{18}O')
title(gca, 'Cross-plot of isotope composition')

nexttile()
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=10/case1.mat')
labels = labelGen(record_32, record_33, record_34);
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 80]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, '\delta^{18}O')
title(gca, 'Cross-plot of isotope composition')

nexttile()
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=0/case2.mat')
labels = labelGen(record_32, record_33, record_34);
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 80]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, '\delta^{18}O')
title(gca, 'Cross-plot of isotope composition')

nexttile()
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=10/case2.mat')
labels = labelGen(record_32, record_33, record_34);
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 80]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, '\delta^{18}O')
title(gca, 'Cross-plot of isotope composition')

nexttile()
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=0/case3.mat')
labels = labelGen(record_32, record_33, record_34);
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 80]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, '\delta^{18}O')
title(gca, 'Cross-plot of isotope composition')

nexttile()
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=10/case3.mat')
labels = labelGen(record_32, record_33, record_34);
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 80]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, '\delta^{18}O')
title(gca, 'Cross-plot of isotope composition')

nexttile()
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=0/case4.mat')
labels = labelGen(record_32, record_33, record_34);
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 80]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, '\delta^{18}O')
title(gca, 'Cross-plot of isotope composition')

nexttile()
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=10/case4.mat')
labels = labelGen(record_32, record_33, record_34);
plotOutput.crossPlot(outputd34, outputd18, labels);
set(gca, 'YLim', [8 22], 'XLim', [20 80]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, '\delta^{18}O')
title(gca, 'Cross-plot of isotope composition')