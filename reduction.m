%% Functions to generate rates in a given state.
classdef reduction
  methods(Static)
    function [OSR_32, OSR_33, OSR_34] = OSRcalc(SO4_32, SO4_33, SO4_34, alpha33, alpha34, OSR_t, SO4)
      %% For sulphur, by organic sulphate reduction (OSR).
      % Angus' eqns. Most accurate in test cases - see notebook for derivation.
      OSR_32 = (OSR_t * SO4_32) .* (1 ./ ((SO4_34 * alpha34) + (SO4_33 * alpha33) + SO4_32));
      OSR_33 = (OSR_t * SO4_33 * alpha33) .* (1 ./ ((SO4_34 * alpha34) + (SO4_33 * alpha33) + SO4_32));
      OSR_34 = (OSR_t * SO4_34 * alpha34) .* (1 ./ ((SO4_34 * alpha34) + (SO4_33 * alpha33) + SO4_32));

      % Adreas' equations - broadly similar results to Angus', but slightly less accurate in test cases.
      %SO4_sum = SO4_32 + SO4_33 + SO4_34;
      %OSR_32 = - SO4_32 ./ (alpha33 * (SO4_sum) + (1 - alpha33) * SO4_32 + (alpha34 - alpha33) * SO4_34) .* - OSR_t;
      %OSR_33 = - SO4_33 * alpha33 ./ (alpha33 * (SO4_sum) + (1 - alpha33) * SO4_32 + (alpha34 - alpha33) * SO4_34) .* - OSR_t;
      %OSR_34 = - SO4_34 * alpha34 ./ (alpha33 * (SO4_sum) + (1 - alpha33) * SO4_32 + (alpha34 - alpha33) * SO4_34) .* - OSR_t;

      % Wortmann equations, 2 isotopes only. 
      %OSR_32 = (OSR_t * (1/alpha34) * SO4_32) ./ (SO4 + ((1/alpha34) - 1) .* SO4_32);
      %OSR_33 = zeros(1000,1);
      %OSR_34 = (OSR_t * SO4_34) ./ ((1/alpha34) * SO4 - ((1/alpha34) - 1) .* SO4_34);

      %% Check numerical errors in rates.
      OSR_32(OSR_32 < 0) = 0;     % Organic sulphate reduction rates can not be negative.
      OSR_33(OSR_33 < 0) = 0;
      OSR_34(OSR_34 < 0) = 0;
      OSR_32(isnan(OSR_32)) = 0;  % Divide by zeros only occur when concentrations or rates are zero - we can never have NaN in conc. array as it will propagate and break.
      OSR_33(isnan(OSR_33)) = 0;
      OSR_34(isnan(OSR_34)) = 0;
    end


    function [AOM_t, AOM_32, AOM_33, AOM_34] = AOMcalc(SO4, SO4_32, SO4_33, SO4_34, alpha33, alpha34, CH4, km1, km2, AOMmax)
      %% For sulphur, by AOM.
      % Calculate total rate of AOM as function of sulphate concentration and methane concentration.
      AOM_t = AOMmax * SO4 ./ (km1 + (SO4)) .* CH4./(km2 + (CH4));
      AOM_t(AOM_t < 0) = 0;

      %Isotope splits. We assume alpha values to be the same as in OSR, so use relations as in OSR.
      AOM_32 = (AOM_t .* SO4_32) ./ (SO4_32 + alpha33 * SO4_33 + alpha34 * SO4_34);
      AOM_33 = (AOM_t .* (alpha33 * SO4_33)) ./ (SO4_32 + alpha33 * SO4_33 + alpha34 * SO4_34);
      AOM_34 = (AOM_t .* (alpha34 * SO4_34)) ./ (SO4_32 + alpha33 * SO4_33 + alpha34 * SO4_34);

      %% Check numerical errors in rates.
      AOM_32(AOM_32 < 0) = 0; % AOM rates can not be negative.
      AOM_33(AOM_33 < 0) = 0;
      AOM_34(AOM_34 < 0) = 0;
      AOM_32(isnan(AOM_32)) = 0; % Divide by zeros only occur when concentrations or rates are zero - we can never have NaN in conc. array as it will propagate and break.
      AOM_33(isnan(AOM_33)) = 0;
      AOM_34(isnan(AOM_34)) = 0;
    end


    function [SRR_t, SRR_32, SRR_33, SRR_34] = SRRScalc(AOM_t, AOM_32, AOM_33, AOM_34, OSR_t, OSR_32, OSR_33, OSR_34)
      %% Combine AOM and OSR to get the total sulphate reduction rate (SRR) for each isotope and overall.
      SRR_t = AOM_t + OSR_t;
      SRR_32 = AOM_32 + OSR_32;
      SRR_33 = AOM_33 + OSR_33;
      SRR_34 = AOM_34 + OSR_34;
     
    end


    function [SRR_16, SRR_18] = SRROcalc(SO4, SO4_16, SO4_18, alpha18, OSR_t)
      %% For oxygen rates are proportional to total organic sulphate reduction rate as in Wortmann 2007.

      SRR_16 = (OSR_t * alpha18 * SO4_16) ./ (SO4 + (alpha18 - 1) .* SO4_16);
      SRR_18 = (OSR_t * SO4_18) ./ (alpha18 * SO4 - (alpha18 - 1) .* SO4_18);

      
      %% Reduction rates can not be negative.
      SRR_16(SRR_16 < 0) = 0; % Rates can not be negative.
      SRR_18(SRR_18 < 0) = 0;
      SRR_16(isnan(SRR_16)) = 0; % Divide by zeros only occur when concentrations or rates are zero - we can never have NaN in conc. array as it will propagate and break.
      SRR_18(isnan(SRR_18)) = 0;
    end
  end
end
