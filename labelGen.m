classdef labelGen
    methods(Static)
        function [labels] = rmsPercentageNormalised(x, y, z)
        total = x + y + z;
        rms = rmsCalc.calculate(total);
        labels = rmsCalc.normalise(rms);
        end

        function [labels] = percentageProgress(initialValue, currentValue, targetValue)
            labels = (initialValue - currentValue) ./ (initialValue - targetValue) * 100;
	end
    end
end
