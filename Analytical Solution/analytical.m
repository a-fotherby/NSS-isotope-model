syms x

D =   5.7e-6 * 14 * 3600; % Diffusion constant.
f = -0.00002; % Forcing term.
IC = 27; % Initial condition.
BC = 27; % Boundary condition.
t = 0;
L = 1000;
k = pi / ( 2 * L );
point = 0

g = figure
set(g,'Units','normal','Position',[0.1 0.2 0.8 0.7])
xlim([0 1000])
ylim([-45 30])

hold on 
while t < 100000000
    n=0;
    funSum = @(x) (4 * f / ( pi * (2*n-1) * D * (k * (2*n-1))^2)) * sin(k * (2*n-1) * x) * ( 1 - exp( -t * D * (k * (2*n-1))^2 ) ) + BC;
    n = n+1;
    while n < 1000
        fun2 = @(x) (4 * f / ( pi * (2*n-1) * D * (k * (2*n-1))^2)) * sin(k * (2*n-1) * x) * ( 1 - exp( -t * D * (k * (2*n-1))^2 ) );
        funSum = @(x) funSum(x) + fun2(x);
        n = n + 1;
    end
   
    fplot(funSum)
    t = t + 5000
    pause(0.1)
end
