classdef regression
    methods(Static)
        function [optik] = optimise(x, y)
        rsqAdj = [];
        k = 1;
        mdl = fitlm(x(1:k,1),y(1,1),'linear')


            while ((mdl.Rsquared.Adjusted >= 0.9980 || isnan(mdl.Rsquared.Adjusted)) && k <= 1000)
                mdl = fitlm(x(1:k,1),y(1:k,1),'linear')
                rsqAdj = horzcat(rsqAdj, mdl.Rsquared.Adjusted) 
                k = k + 1;
            end

        optik = k - 2
        end
    end
end