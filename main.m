%% Implicit method for solving PDEs.
% Clear the workspace.
clear variables
clear all

% Call the model parameters and then initialise the model.
parameters;
initialise;


%% Call the script which will change the model parameters for the chosen test case.
case1


%% Initialise figures for plotting.
f=figure;
set(f,'Units','normal','Position',[0.1 0.2 0.8 0.7] )
A=gca;

subplot(2,2,1)
subplot(2,2,2)
subplot(2,2,3)
subplot(2,2,4)

z=get(f,'children');
set(f,'Color',[1 1 1])



%% Run simulation.
runSim;