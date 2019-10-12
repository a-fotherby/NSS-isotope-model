syms x

D =  5.7e-6 * 14 * 3600; % Diffusion constant.
f = -0.00002; % Forcing term.
IC = 27; % Initial condition.
BC = 27; % Boundary condition.
t = 0;
L = 1000;
k = pi / ( 2 * L );

g = figure
set(g,'Units','normal','Position',[0.1 0.2 0.8 0.7])
xlim([0 1000])
ylim([-45 30])

hold on

n=0;
funSum = @(x) (4 * f / ( pi * (2*n-1) * D * (k * (2*n-1))^2)) * sin(k * (2*n-1) * x) + BC;
n = n+1;
while n < 200
    %fun2 = @(x) (4 * f / ( pi * (2*n-1) * D * (k * (2*n-1))^2)) * sin(k * (2*n-1) * x);
    fun2 = @(x) (sinc(pi * n / 400) * (4 * f / ( pi * (2*n-1) * D * (k * (2*n-1))^2)) * sin(k * (2*n-1) * x));
    funSum = @(x) funSum(x) + fun2(x);
    n = n + 1
end

fplot(funSum)


