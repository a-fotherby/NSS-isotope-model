%% Data capture code.
if i == i_lastSample + 250000 || i==0 || i == 2500 || i==5000 || i == 7500 || i == 10000 || i== 50000 || i== 100000 || i==125000 || i==150000 || i==175000 || i==200000 || i==225000
    captureData;

    if i == i_lastSample + 250000
      i_lastSample = i_lastSample + 250000;
    end

    i
    RMSSO4
end