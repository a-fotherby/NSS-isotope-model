classdef safe
    methods(Static)
        function concentration = concentration(species, speciesIsoSum)
            %% Safety code for concentrations, deals with small concentration numerical instabilities.
            % The smallest value to deal with in terms of concentration.
            limit = eps;                      
            species((speciesIsoSum) <= limit) = 0;
            concentration = species;
        end
        
        function rate = rate(consumptionRate, speciesIsoSum, safety)
            % This conditions is essential. We cannot have a concentration of zero.
            consumptionRate((speciesIsoSum) < safety) = consumptionRate((speciesIsoSum) < safety) .* speciesIsoSum((speciesIsoSum) < safety) ./ safety;
            rate = consumptionRate;
        end
    end
end

