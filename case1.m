%% Parameters for the first case. Start at high sulphate concentration and evolve to steady state.
% Data capture parameters. Allows dataCapture.m to file the data correctly.
trial = 1;

% Sulphate concentration constant and large to begin with.
SO4 = ones (l,1) .* SO4_sw; % Start with sulphate concentration in column at fraction of seawater.

%% Generate inital isotope splits based on seawater.
% Sulphur.
SO4_32(:,1) = SO4 .* (1 / (1 + R33vcdt * (d33S_sw / 1000 +1) + R34vcdt * (d34S_sw /1000 +1)));
SO4_33(:,1) = SO4 .* ((d33S_sw / 1000 + 1) * R33vcdt) / (1 + R33vcdt * (d33S_sw / 1000 +1) + R34vcdt * (d34S_sw /1000 +1));
SO4_34(:,1) = SO4 .* ((d34S_sw / 1000 + 1) * R34vcdt) / (1 + R33vcdt * (d33S_sw / 1000 +1) + R34vcdt * (d34S_sw /1000 +1));

% Oxygen.
SO4_16(:,1) = SO4 .* (1 / (1 + R18vsmow * (d18O_sw / 1000 +1)));
SO4_18(:,1) = SO4 .* (R18vsmow * (d18O_sw / 1000 +1) / (1 + R18vsmow * (d18O_sw / 1000 +1)));

load('target1.mat')
