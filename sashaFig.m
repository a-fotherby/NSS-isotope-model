f=figure;
set(f,'Units','normal','Position',[0.1 0.2 0.8 0.7] )
A=gca;

% Generate the subplots.
subplot(2,2,1)
subplot(2,2,2)
subplot(2,2,3)
subplot(2,2,4)

z=get(f,'children');
set(f,'Color',[1 1 1])

%% Chemical concentration (left most graph).
% Plot data.
axes(z(end))
plotOutput.depthPlot(record_SO4, depth, labels)

% Format graph.
set(z(end),'YDir','reverse', 'YLim',[0 l],'XLim',[0 27],'XAxisLocation','Top');
xlabel(z(end), 'Concentration / \mu mol cm^{-3}')
ylabel(z(end), 'Depth / cm')
title(z(end), 'Depth profile of SO_4 during the approach to steady state')


%% Delta-O-18 and depth concentration.
% Select axis and plot data.
axes(z(end-1))
hold off
plotOutput.depthPlot(outputd18, depth, labels);
hold on

% Format graph.
set(z(end-1),'YDir','reverse','YLim',[0 l],'XLim',[7 22],'XAxisLocation','Top');
xlabel(z(end-1), '\delta^1^8O')
ylabel(z(end-1), 'Depth [cm]')
title(z(end-1), 'Depth profile of \delta^1^8O during the approach to steady state')
drawnow

%% Delta-S-34 and depth concentration.
% Select axis and plot data.
axes(z(end-2))
hold off
plotOutput.depthPlot(outputd34, depth, labels);

% Format graph.
set(z(end-2),'YDir','reverse','XLim',[20,100],'YLim',[0 l], 'XAxisLocation', 'Top');
xlabel(z(end-2), '\delta^3^4S')
ylabel(z(end-2), 'Depth [cm]')
title(z(end-2), 'Depth profile of \delta^3^4S during the approach to steady state')


%% Delta-S-34 vs. Delta-O-18
axes(z(end-3))
hold off
plotOutput.crossPlot(outputd34, outputd18, labels);

set(z(end-3), 'YLim', [8 22], 'XLim', [20 80]);
xlabel(z(end-3), '\delta^3^4S')
ylabel(z(end-3), '\delta^1^8O')
title(z(end-3), 'Plot of \delta^{34}S against \delta^{18}O during the approach to steady state')
drawnow
