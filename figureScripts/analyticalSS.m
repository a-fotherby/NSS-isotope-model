syms x

D =  5.7e-6 * 14 * 3600; % Diffusion constant.
f = -0.00002; % Forcing term.
IC = 27; % Initial condition.
BC = 27; % Boundary condition.
t = 0;
L = 1000 * sqrt(2);
k = pi / ( 2 * L );

g = figure
set(g,'Units','normal','Position',[0.1 0.2 0.8 0.7])

hold on

fun = @(x) ((f * L) / D) * x + BC - (f / (2*D)) * x.^2 

fplot(fun)

set(gca,'XLim',[20,100],'YLim',[0 L]);
xlim([0 L])
ylim([-45 30])
xlabel('Depth / cm')
ylabel('Concentration / \mumol cm^{-3}')
camroll(-90)
