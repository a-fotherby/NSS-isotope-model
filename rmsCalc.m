
classdef rmsCalc
    methods(Static)
        function [rmsArray] = calculate(inputMatrix)
            matrixSize = size(inputMatrix, 2);
            finalCol = inputMatrix(:, matrixSize);
            m = 1;
            rmsArray = [];
            
            while m <= matrixSize
                rms = sqrt(sum((finalCol - (inputMatrix(:, m))) .^ 2)/1000);
                rmsArray = horzcat(rmsArray, rms)
                
                m = m + 1; 
            end
        end
        
        function [rmsPCArray] = normalise(rmsArray)
            rmsPCArray = (1 - (rmsArray ./ rmsArray(1,1))) .* (100);
        end
    end
end

            