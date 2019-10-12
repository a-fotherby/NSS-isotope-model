%% Declare a fucntion that iterates the concentration and returns a new array.
function [concIt] = iterate(species, reduction, dif, BCS, dz)


%% Offset concentration vectors to save time in computation.
C_0 = species(1:end-2); % Back offset term.
C_1 = species(2:end-1); % No offset term.
C_2 = species(3:end);   % Forward offset term.


%% Formula for iterating - in notebook. Iterates concentration by adding second order changes due to diffusion and subtracting the sulphur reduced from the previous vector.
concIt(2:length(species) - 1,1) = dif * (C_2 + C_0 - 2 * C_1) / (dz ^ 2) - reduction(2:end-1) + C_1;


%% Boundary conditions
switch BCS
    case 1
    concIt(1) = species(1); % Concentration constant at top.
    concIt = vertcat(concIt, concIt(end-1)); % Constant concentration gradient at bottom.

    case 2
    concIt = vertcat(concIt, species(end)); % Constant concentration at bottom.
end


%% We can not have a negative concentration as is unphysical.
concIt((concIt) < 0) = 0;
