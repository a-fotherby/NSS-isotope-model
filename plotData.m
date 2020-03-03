%% Select figure set up in main.
figure(f)

%% Sums for plotting.
SO4_sum = SO4_32 + SO4_34 + SO4_33;

d18_SO4 = (((SO4_18 ./ SO4_16) / R18vsmow) - 1) * 1000;
d34S_SO4 = (((SO4_34 ./ SO4_32) / R34vcdt) - 1) * 1000;
d33S_SO4 = (((SO4_33 ./ SO4_32) / R33vcdt) - 1) * 1000;

d18_SO4((d18_SO4) > 4e+05) = NaN;
d34S_SO4((d34S_SO4) > 4e+05) = NaN;

ind_16 = find(isnan(d18_SO4), 1, 'first');
ind_34 = find(isnan(d18_SO4), 1, 'first');

d18_SO4(ind_16:end, 1) = NaN;
d34S_SO4(ind_34:end, 1) = NaN;



%% Chemical concentration (left most graph).
% Plot data.
axes(z(end))
hold off
plot(SO4, 1:l, 'LineWidth',2,'color','r')
hold on
plot(SO4_sum, 1:l, '--')
plot(CH4, 1:l, 'LineWidth', 2, 'color', 'b')


% Format graph.
set(z(end),'YDir','reverse', 'YLim',[0 l],'XLim',[0 30],'XAxisLocation','Top','FontName','Calibri','FontSize',[10]);
xlabel(z(end), 'Concentration [units]', 'FontName', 'Calibri', 'FontSize',[10])
ylabel(z(end), 'Depth [cm]', 'FontName', 'Calibri', 'FontSize',[10])
legend('SO_4', 'SO_4 isotope sum', 'CH_4')

%% Delta-O-18 and depth concentration.
% Select axis and plot data.
axes(z(end-1))
hold off
plot(d18_SO4, 1:l, 'LineWidth', 2, 'color', 'r')
hold on

% Format graph.
set(z(end-1),'YDir','reverse','YLim',[0 l],'XLim',[0 30],'XAxisLocation','Top','FontName','Calibri','FontSize',[10]);
xlabel(z(end-1), '\delta^1^8O','FontName','Calibri','FontSize',[10])
ylabel(z(end-1), 'Depth [cm]','FontName','Calibri','FontSize',[10])
drawnow

%% Delta-S-34 and depth concentration.
% Select axis and plot data.
axes(z(end-2))
hold off
plot(d34S_SO4, 1:l, 'LineWidth', 2, 'color', 'r')

% Format graph.
set(z(end-2),'YDir','reverse','XLim',[20,100],'YLim',[0 l], 'XAxisLocation', 'Top');
xlabel(z(end-2), '\delta^3^4S','FontName','Calibri','FontSize',[10])
ylabel(z(end-2), 'Depth [cm]','FontName','Calibri','FontSize',[10])


%% Delta-S-34 vs. Delta-O-18
axes(z(end-3))
hold off
plot(d34S_SO4,d18_SO4,'LineWidth',0.1)

set(z(end-3), 'YLim', [8 28], 'XLim', [0 80]);
xlabel(z(end-3), '\delta^3^4S', 'FontName', 'Calibri', 'FontSize', [10])
ylabel(z(end-3), '\delta^1^8O', 'FontName', 'Calibri', 'FontSize', [10])
drawnow
