%% Initialise concentration vectors.
SO4 = ones(l,1) .* SO4_sw; % Start with sulphate concentration in column at fraction of seawater.

% Initialise sulphur isotope vectors based on seawater composition.
SO4_32 = SO4 .* (1 / (1 + R33vcdt * (d33S_sw / 1000 +1) + R34vcdt * (d34S_sw /1000 +1)));
SO4_33 = SO4 .* ((d33S_sw / 1000 + 1) * R33vcdt) / (1 + R33vcdt * (d33S_sw / 1000 +1) + R34vcdt * (d34S_sw /1000 +1));
SO4_34 = SO4 .* ((d34S_sw / 1000 + 1) * R34vcdt) / (1 + R33vcdt * (d33S_sw / 1000 +1) + R34vcdt * (d34S_sw /1000 +1));

% Initialise oxygen isotope vectors based on seawater composition.
SO4_16 = SO4 .* (1 / (1 + R18vsmow * (d18O_sw / 1000 +1)));
SO4_18 = SO4 .* (R18vsmow * (d18O_sw / 1000 +1) / (1 + R18vsmow * (d18O_sw / 1000 +1)));

% Initialise methane vector.
CH4 = zeros(l-1,1);
CH4 = vertcat(CH4, 0);


%% Matricies for recording the data.
record_32 = [];
record_33 = [];
record_34 = [];
record_16 = [];
record_18 = [];
record_CH4 = [];
record_SO4 = [];

%% Delete some of the final output variables.
clearvars outputd18;
clearvars outputd34;
