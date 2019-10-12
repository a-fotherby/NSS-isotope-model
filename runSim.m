% This is called by main.m and handles the running of the simulation. It runs
% all of the functions to calculate changes in concentration due to reduction,
% exchange etc. and then calls iterate.m to apply those changes. It does it for
% every isotope concentration.

while RMSSO4 > steadyStateLimit
  i = i + 1;
  % Generate the new rates every iteration.
  [OSR_32, OSR_33, OSR_34] = reduction.OSRcalc(SO4_32, SO4_33, SO4_34, alpha33, alpha34, OSR_t, SO4);
  [AOM_t, AOM_32, AOM_33, AOM_34] = reduction.AOMcalc(SO4, SO4_32, SO4_33, SO4_34, alpha33, alpha34, CH4, km1, km2, AOMmax);
  [SRR_t, SRR_32, SRR_33, SRR_34] = reduction.SRRScalc(AOM_t, AOM_32, AOM_33, AOM_34, OSR_t, OSR_32, OSR_33, OSR_34);
  [SRR_16, SRR_18] = reduction.SRROcalc(SO4, SO4_16, SO4_18, alpha18, OSR_t);
  [b_16, b_18] = eq_exchange.O_exchange(SO4, SO4_16, SO4_18, R18vsmow, b_O, k, enrichment);

  % Define a rate of total oxygen isotope reduction.
  ORR16_t = SRR_16 - b_16; % Is this way around because reduction value is subtracted in the iterate method.
  ORR18_t = SRR_18 - b_18;

  %% Safety code for rates.
  SO4_sum = SO4_32 + SO4_34;
  O_sum = SO4_16 + SO4_18;
  check = SO4_sum - O_sum;
  safety = 0.1;                                                                                     % Picked value, seems to work best.
  SRR_32((SO4_sum) < safety) = SRR_32((SO4_sum) < safety) .* SO4_sum((SO4_sum) < safety) ./ safety; % This conditions is essential. We cannot have a concentration of zero.
  SRR_33((SO4_sum) < safety) = SRR_33((SO4_sum) < safety) .* SO4_sum((SO4_sum) < safety) ./ safety;
  SRR_34((SO4_sum) < safety) = SRR_34((SO4_sum) < safety) .* SO4_sum((SO4_sum) < safety) ./ safety;
  ORR16_t((O_sum) < safety) = ORR16_t((O_sum) < safety) .* SO4_sum((O_sum) < safety) ./ safety;
  ORR18_t((O_sum) < safety) = ORR18_t((O_sum) < safety) .* SO4_sum((O_sum) < safety) ./ safety;
  SRR_t((SO4_sum) < safety) = SRR_t((SO4_sum) < safety) .* SO4_sum((SO4_sum) < safety) ./ safety;

  % Capture concentration pre-iteration for use in loop condition.
  SO4_b = SO4;


  %% Iterate the concentrations using the newly generated rates.
  % Sepeate reduction and exchange parameters have been removed now, and are all lumped into the a single reduction value.
  SO4 = iterate(SO4, SRR_t, dif, BCS, dz);
  SO4_32 = iterate(SO4_32, SRR_32, dif, BCS, dz);
  SO4_33 = iterate(SO4_33, SRR_33, dif, BCS, dz);
  SO4_34 = iterate(SO4_34, SRR_34, dif, BCS, dz);
  SO4_16 = iterate(SO4_16, ORR16_t, dif, BCS, dz);
  SO4_18 = iterate(SO4_18, ORR18_t, dif, BCS, dz);
  CH4  = iterate(CH4, AOM_t, dif, 2, dz); % BC is constant concentration at bottom.

  %% Safety code for concentrations, deals with small concentration numerical instabilities.
  limit = eps;                      % The smallest value to deal with in terms of concentration. The is the lower computation limit; concentrations below this are not meaningful.
  SO4_sum = SO4_32 + SO4_34;
  O_sum = SO4_16 + SO4_18;
  SO4_sum((SO4_sum) <= limit) = 0;  % Any value below eps is set to eps.
  SO4_32((SO4_sum) <= limit) = 0;
  SO4_33((SO4_sum) <= limit) = 0;
  SO4_34((SO4_sum) <= limit) = 0;
  O_sum((O_sum) <= limit) = 0;
  ORR16_t((O_sum) <= limit) = 0;
  ORR18_t((O_sum) <= limit) = 0;
  CH4((CH4) <= limit) = 0;


  %% Find RMS over column for loop condition.
  RMSSO4 = sqrt(sum((SO4 - SO4_b) .^ 2));

  %% If doing closed system calculations uncomment this for better resolution sampling.
  %if i == i_lastSampleCL + 2500000

  %  record_32 = horzcat(record_32, SO4_32);
  %  record_33 = horzcat(record_33, SO4_33);
  %  record_34 = horzcat(record_34, SO4_34);
  %  record_16 = horzcat(record_16, SO4_16);
  %  record_18 = horzcat(record_18, SO4_18);
  %  record_CH4 = horzcat(record_CH4, CH4);

  %  i_lastSampleCL = i;

   % i
   % RMSSO4
  %end

  %% Capture data at intervals seperated by an order of magnitude in time.
  if i == (i_lastSample + 1) * 5
    record_32 = horzcat(record_32, SO4_32);
    record_33 = horzcat(record_33, SO4_33);
    record_34 = horzcat(record_34, SO4_34);
    record_16 = horzcat(record_16, SO4_16);
    record_18 = horzcat(record_18, SO4_18);
    record_CH4 = horzcat(record_CH4, CH4);
    record_SO4 = horzcat(record_SO4, SO4);

    i_lastSample = i_lastSample + 50000;

    i
    RMSSO4
  end

  %% Plotting.
  if i/10000==round(i/10000) % Plotting every 1000 years.
    plotData
  end
end % End of main program loop.


%% Post program code.


%% Last data capture - final values.
record_32 = horzcat(record_32, SO4_32);
record_33 = horzcat(record_33, SO4_33);
record_34 = horzcat(record_34, SO4_34);
record_16 = horzcat(record_16, SO4_16);
record_18 = horzcat(record_18, SO4_18);
record_CH4 = horzcat(record_CH4, CH4);
record_SO4 = horzcat(record_SO4, SO4);

% Create delta18 and delta34 matricies for output.
outputd18 = (((record_18 ./ record_16) / R18vsmow) - 1) * 1000;
outputd34 = (((record_34 ./ record_32) / R34vcdt) - 1) * 1000;


%% Sanitise the isotope data.
outputd18((outputd18) > 4e+05) = NaN; % Remove any large values as these are non physical and generated by numerical instabilities.
outputd34((outputd34) > 4e+05) = NaN;

% Create offset versions of the output matrix for data cleaning.
outputd18_off1 = outputd18(1:end-1, :); % No offset.
outputd18_off2 = outputd18(2:end, :); % Offset forward.
outputd34_off1 = outputd18(1:end-1, :); % No offset.
outputd34_off2 = outputd18(2:end, :); % Offset forward.

% Data cleaning loop.
cleanLoop = 1;
for cleanLoop = 1:size(outputd18_off1, 2)
    ind_18 = find(((outputd18_off2(:, cleanLoop) - outputd18_off1(:, cleanLoop)) < 0), 1, 'first');
    outputd18(ind_18:end, cleanLoop) = NaN;
end

for cleanLoop = 1:size(outputd34, 2)
    ind_34 = find(((outputd34_off2(:, cleanLoop) - outputd34_off1(:, cleanLoop)) < 0), 1, 'first');
    outputd34(ind_34:end, cleanLoop) = NaN;
end


%% Collate and write data.

% Write the data out.
writeData.output(trial, 'SO4_32', record_32, steadyStateSwitch, recycling, dif)
writeData.output(trial, 'SO4_33', record_33, steadyStateSwitch, recycling, dif)
writeData.output(trial, 'SO4_34', record_34, steadyStateSwitch, recycling, dif)
writeData.output(trial, 'SO4_16', record_16, steadyStateSwitch, recycling, dif)
writeData.output(trial, 'SO4_18', record_18, steadyStateSwitch, recycling, dif)
writeData.output(trial, 'CH4', record_CH4, steadyStateSwitch, recycling, dif)
writeData.output(trial, 'd18', outputd18, steadyStateSwitch, recycling, dif)
writeData.output(trial, 'd34', outputd34, steadyStateSwitch, recycling, dif)


%% Switch the steady state conditions here, if it is required by the case you are testing.
if steadyStateSwitch == 0
  switch trial
    case 3
      %% Change logical variables.
      i = 0;
      i_lastSample = 1;
      steadyStateSwitch = 1;  % Prevent the parameter change from running again upon reaching steady state a second time.
      RMSSO4 = 1;             % Ensure another loop occurs and that it doesn't immediately drop out of the loop.
      steadyStateLimit = eps; % Have a think about the best way to deal with this.


      %% Reinitialise record of isotopes.
      record_32 = [];
      record_33 = [];
      record_34 = [];
      record_16 = [];
      record_18 = [];
      record_CH4 = [];
      record_SO4 = [];

      OSR_t = OSR_t / 10;

      %% Start running the simulation again.
      runSim

    case 4
      %% Change logical variables.
      i = 0;
      i_lastSample = 1;
      steadyStateSwitch = 1;  % Prevent the parameter change from running again upon reaching steady state a second time.
      RMSSO4 = 1;             % Ensure another loop occurs and that it doesn't immediately drop out of the loop.
      steadyStateLimit = eps * 10 ^ (-1); % Have a think about the best way to deal with this.


      %% Reinitialise record of isotopes.
      record_32 = [];
      record_33 = [];
      record_34 = [];
      record_16 = [];
      record_18 = [];
      record_CH4 = [];


      %% Change sulphur concentration at top of array and change isotope splits in that block to reflect new concentration.
      SO4(1,1) = 10;

      % Sulphur isotopes.
      SO4_32(1,1) = SO4(1,1) .* (1 / (1 + R33vcdt * (d33S_sw / 1000 +1) + R34vcdt * (d34S_sw /1000 +1)));
      SO4_33(1,1) = SO4(1,1) .* ((d33S_sw / 1000 + 1) * R33vcdt) / (1 + R33vcdt * (d33S_sw / 1000 +1) + R34vcdt * (d34S_sw /1000 +1));
      SO4_34(1,1) = SO4(1,1) .* ((d34S_sw / 1000 + 1) * R34vcdt) / (1 + R33vcdt * (d33S_sw / 1000 +1) + R34vcdt * (d34S_sw /1000 +1));
      % Oxygen isotopes.
      SO4_16(1,1) = SO4(1,1).* (1 / (1 + R18vsmow * (d18O_sw / 1000 +1)));
      SO4_18(1,1) = SO4(1,1).* (R18vsmow * (d18O_sw / 1000 +1) / (1 + R18vsmow * (d18O_sw / 1000 +1)));

      % Start running the simulation again.
      runSim
  end
end
