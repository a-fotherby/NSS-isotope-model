%% Data capture code.
% Compare floor of pProgess to intervals of 5 to capture at 5% increments to steady state.
% Use a flag to ensure that each percentage increment is only recorded once.

if flag == 0
    if floor(pProgress) == pProgressNext
        record_32 = horzcat(record_32, SO4_32);
        record_33 = horzcat(record_33, SO4_33);
        record_34 = horzcat(record_34, SO4_34);
        record_16 = horzcat(record_16, SO4_16);
        record_18 = horzcat(record_18, SO4_18);
        record_CH4 = horzcat(record_CH4, CH4);
        record_SO4 = horzcat(record_SO4, SO4);
        record_i = horzcat(record_i, i);
        record_RMS = horzcat(record_RMS, RMSSO4);

        pProgressNext = pProgressNext + 5;
        flag = 1;
    end
else
    if floor(pProgress) == pProgressNext - 1
        flag = 0;
    end
end