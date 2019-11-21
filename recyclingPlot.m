%% Implicit method for solving PDEs.
% Clear the workspace.
clear variables
clear all

% Call the model parameters and then initialise the model.
parameters;
initialise;


%% Call the script which will change the model parameters for the chosen test case.
case1


%% Script to run the simulation many times with different recycling values.
recyclingParams = [0 0.1 0.5 1 2 5 10 25 50 100 500 1000 10000 100000 1000000];
for recycling = recyclingParams
    recycling
    % Recycling paramter actually enters model through this variable, so
    % need to update.
    b_O = OSR_t * recycling;
    runSim;
    delta18 = outputd18(:,end);
    delta34 = outputd34(:,end);
    plot(delta34, delta18, 'DisplayName', sprintf('%d', recycling))
    set(gca, 'YLim', [8 22], 'XLim', [20 80]);
    legend
    hold on
    drawnow
    
    parameters;
    initialise;
    case1;
end    
    