f=figure;
%set(f,'Units','normal','Position',[0.1 0.2 0.8 0.7] )
%A=gca;

depth = 1:l;
depth = depth .* sqrt(2);
depth = depth';

%labels = labelGen(record_32, record_33, record_34);


labels = (initRMSSO4 - record_RMS) ./ (initRMSSO4 - steadyStateLimit) * 100;

tiledlayout(2,2)

nexttile()

%% Chemical concentration (left most graph).
% Plot data.
plotOutput.depthPlot(record_SO4, depth, labels)

% Format graph.
set(gca,'YDir','reverse', 'YLim',[0 l * dz],'XLim',[0 27],'XAxisLocation','Top');
xlabel(gca, '[SO_4] / mM')
ylabel(gca, 'Depth / cm')
title(gca, 'Sulfate concentration')

nexttile()
%% Delta-O-18 and depth concentration.
% Select axis and plot data.
plotOutput.depthPlot(outputd18, depth, labels);

% Format graph.
set(gca,'YDir','reverse','YLim',[0 l * dz],'XLim',[7 30],'XAxisLocation','Top');
xlabel(gca, '\delta^{18}O')
ylabel(gca, 'Depth / cm')
title(gca, 'Oxygen isotope composition')
drawnow

%% Delta-S-34 and depth concentration.
% Select axis and plot data.
nexttile()

plotOutput.depthPlot(outputd34, depth, labels);

% Format graph.
set(gca,'YDir','reverse','XLim',[20,100],'YLim',[0 l * dz], 'XAxisLocation', 'Top');
xlabel(gca, '\delta^{34}S')
ylabel(gca, 'Depth / cm')
title(gca, 'Sulfure isotope composition')


%% Delta-S-34 vs. Delta-O-18
nexttile()
plotOutput.crossPlot(outputd34, outputd18, labels);

set(gca, 'YLim', [8 22], 'XLim', [20 80]);
xlabel(gca, '\delta^{34}S')
ylabel(gca, '\delta^{18}O')
title(gca, 'Cross-plot of isotope composition')

