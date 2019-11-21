%% Data capture code.
if i == i_lastSample + 250000 || i==0 || i == 2500 || i==5000 || i == 7500 || i == 10000 || i== 50000 || i== 100000 || i==125000 || i==150000 || i==175000 || i==200000 || i==225000
    record_32 = horzcat(record_32, SO4_32);
    record_33 = horzcat(record_33, SO4_33);
    record_34 = horzcat(record_34, SO4_34);
    record_16 = horzcat(record_16, SO4_16);
    record_18 = horzcat(record_18, SO4_18);
    record_CH4 = horzcat(record_CH4, CH4);
    record_SO4 = horzcat(record_SO4, SO4);


    if i == i_lastSample + 250000
      i_lastSample = i_lastSample + 250000;
    end

    i
    RMSSO4
end