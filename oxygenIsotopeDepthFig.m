tiledlayout(4,2);

load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=0/case1.mat')

depth = 1:l;
depth = depth .* sqrt(2);
depth = depth';

nexttile()
labels = labelGen(record_32, record_33, record_34);
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O')
ylabel(gca, 'Depth / cm')
title(gca, 'Oxygen isotope composition')

nexttile();
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=10/case1.mat');
labels = labelGen(record_32, record_33, record_34);
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O');
ylabel(gca, 'Depth / cm');
title(gca, 'Oxygen isotope composition');

nexttile();
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=0/case2.mat');
labels = labelGen(record_32, record_33, record_34);
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O');
ylabel(gca, 'Depth / cm');
title(gca, 'Oxygen isotope composition');

nexttile();
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=10/case2.mat');
labels = labelGen(record_32, record_33, record_34);
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O');
ylabel(gca, 'Depth / cm');
title(gca, 'Oxygen isotope composition');

nexttile();
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=0/case3.mat');
labels = labelGen(record_32, record_33, record_34);
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O');
ylabel(gca, 'Depth / cm');
title(gca, 'Oxygen isotope composition');

nexttile();
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=10/case3.mat');
labels = labelGen(record_32, record_33, record_34);
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O');
ylabel(gca, 'Depth / cm');
title(gca, 'Oxygen isotope composition');


nexttile();
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=0/case4.mat');
labels = labelGen(record_32, record_33, record_34);
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O');
ylabel(gca, 'Depth / cm');
title(gca, 'Oxygen isotope composition');

nexttile();
load('/Users/angus/Dropbox/Academic/Isotope Model/Model/Case Data/rec=10/case4.mat');
labels = labelGen(record_32, record_33, record_34);
plotOutput.depthPlot(outputd18, depth, labels);
% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O');
ylabel(gca, 'Depth / cm');
title(gca, 'Oxygen isotope composition');


