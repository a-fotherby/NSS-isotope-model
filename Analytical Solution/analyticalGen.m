syms x

D =  5.7e-6 * 14 * 3600; % Diffusion constant.
f = -0.00002; % Forcing term.
IC = 27; % Initial condition.
BC = 27; % Boundary condition.
t = 0;
L = 1000;
k = pi / ( 2 * L );
point = 0;
    
anSolution = [];
analyticalRecord = [];

fun2 = @(x) (4 * f / ( pi * (2*n-1) * D * (k * (2*n-1))^2)) * sin(k * (2*n-1) * x) * ( 1 - exp( -t * D * (k * (2*n-1))^2 ) );

while t < 50000000
    n=0;
    funSum = @(x) (4 * f / ( pi * (2*n-1) * D * (k * (2*n-1))^2)) * sin(k * (2*n-1) * x) * ( 1 - exp( -t * D * (k * (2*n-1))^2 ) ) + BC;
    n = n+1;
    while n < 1000
        fun2 = @(x) (4 * f / ( pi * (2*n-1) * D * (k * (2*n-1))^2)) * sin(k * (2*n-1) * x) * ( 1 - exp( -t * D * (k * (2*n-1))^2 ) );
        funSum = @(x) funSum(x) + fun2(x);
        n = n + 1
    end
    t = t + 100000;
    while point < 1000
        funcSample = funSum(point);
        point = point + 1;
        anSolution = vertcat(anSolution, funcSample);
    end
    analyticalRecord = horzcat(analyticalRecord, anSolution);
    point = 0;
    anSolution = [];
end