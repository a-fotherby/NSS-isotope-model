figure(f)


d18_SO4=((SO4_18 ./ SO4_16) / R18vsmow-1) * 1000;
d34_SO4 = ((SO4_34 ./ SO4_32) / R34vcdt - 1) * 1000;

axes(z(end-4))
  hold on
  plot(d34_SO4(1:200), d18_SO4(1:200),'LineWidth', 3, 'color', 'r')
  set(z(end-4),'YLim',[8 28],'XLim',[0 80]);%'YLim',[0 L],'XLim',[0 30],'XAxisLocation','Top','FontName','Times new Roman','FontSize',[12],'FontWeight','Bold');

  drawnow
