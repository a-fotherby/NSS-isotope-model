
%% Initialise logical variables. We discretise the column into cm elements.
l = 1000;               % Column length.
dz = sqrt(2);           % Space step /cm.
BCS = 1;                % Boundary conditions value. 1 for constant gradiant at bottom and constant concentration at top. 2 for const. conc. at bottom. Passed to iterate based on species.
RMSSO4 = 1;             % Loop conditon. Initialise at 1 to ensure at least one loop.
i = 0;                  % Plotting counter.
i_lastSampleCL = 0;
i_lastSample = 0;       % Ensure that dataCapture is triggered on first iteration.
count = 0;              % Initialise counting for dataCapture.
steadyStateSwitch = 0;  % Logical variable for switching the conditions once a test case reaches steady state.
steadyStateLimit = eps; % How much root mean square variation between interations before the program stops (i.e. what do we consider to be steady state).


%% Mechanism parameters.
recycling = 10; % Determines ratio of reduction to equilibreum exchange occuring.

% Organic sulphate Reduction (OSR) mechanism parameters.
OSR_t = 0.00002;                 % Total sulphate production rate.
%OSR_t = 1.912280 * 10^(-6)};      % Total sulphate production rate.
alpha34 = 0.975 - 0.05 * (recycling / (recycling + 1));
alpha33 = alpha34 ^ 0.5145;

% Anaerobic Oxidation of Methane (AOM) mechanism parameters.
AOMmax = 10 * OSR_t;  % Maximum AOM rate.
km1 = 0.00001;        % AOM sulphate sensitivity. umole cm-3
km2 = 0.00001;        % AOM methane sensitivity. umole cm-3

% Oxygen fractionation parameters. Tie oxygen fractionation into sulphur fractionation.
alpha18 = 1 + (1 - (alpha34 + 0.05 * (recycling / (recycling + 1)))) * 1000 / 4000;

% Equlibrium fractionation parameters.
enrichment = 20;
k = 1;                    % Extent of exchange reaction. Again I picked a rdm number.
b_O = OSR_t * recycling;  % Reaction velocity. Recycling defined at top of main.


%% Environmental parameters.
porosity = 0.8; % Porosity of the medium.
temp = 14;
dif = 5.7e-6 * 3600 * temp;  % We have chosen diffusion to be constant with depth.
%dif = (4.655 + 0.2125 * temp) * 10^(-6) * 3600 ;  % cm^2/hr We have chosen diffusion to be constant with depth.
SO4_sw = 27;               % Seawater SO4 concentration in umole cm-3.


%% Ratios and isotope concentrations.
% Standard ratios.
R33vcdt = 0.007874964;  % Ratio of 33S to 32S in VCDT.
R34vcdt = 0.04416255;   % Ratio of 34S to 32S 34S in VCDT.
R18vsmow = 0.0020052;   % Ratio of 18O to 16O in V-SMOW.

% Deltas for different isotopes.
d33S_sw = 11.1; % Delta-33-S in seawater, in per mille.
d34S_sw = 21.1; % Delta-34-S in seawater, in per mille.
d18O_sw = 8.6;  % Delta-18-O in seawater, in per mille.
