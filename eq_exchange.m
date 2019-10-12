%% Model the equilibreum exhange effect for oxygen isotopes. Must be recalculated every iteration as in concentration dependant.
classdef eq_exchange
  methods(Static)
    function [b_16, b_18] = O_exchange(SO4, SO4_16, SO4_18, R18vsmow, b, k, enrichment)

      %% Calculate fractionation in and out of mechanism.
      d18O_H2O = 0;                                                 % We assume delta-O-18 is zero in water.
      delta_in = ((SO4_18 ./ SO4_16) - R18vsmow) / R18vsmow;
      delta_out = delta_in * (1 - k) + k * (d18O_H2O + enrichment);


      %% Calculate rate of equilibrium fractionation.
      b_16 = b * ((1 ./ (1 + ((delta_out / 1000) + 1) * R18vsmow)) - (SO4_16 ./ SO4));
      b_18 = b * ((((delta_out / 1000 + 1) * R18vsmow)) ./ (1 + ((delta_out / 1000 + 1) * R18vsmow)) - (SO4_18 ./ SO4));

      %% Check for non-phyisicalities.
      b_16(isnan(b_16)) = 0; % We do not allow divide by zero rates. Caused by conc. being zero so is logical to set rate to zero also. 
      b_18(isnan(b_18)) = 0;
    end
  end
end
