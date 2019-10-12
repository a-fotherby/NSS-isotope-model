classdef gradient
    methods(Static)
        function [] = plotAgainst(x, y, plotVS)
            f = figure
            set(f,'Units','normal','Position',[0.1 0.2 0.8 0.7])
            hold on
            
            gradArray = [];
            n = 1;
            plotNum = size(x,2);
            
            while n <= plotNum
                q = regression.optimise(x(:,n),y(:,n));
                mdl = fitlm(x(1:q,n),y(1:q,n));
                grad = mdl.Coefficients.Estimate;
                gradArray = horzcat(gradArray, grad);
                
                n = n + 1;
            end
            
            plot(plotVS, gradArray(2, :))
        end
    end
end
