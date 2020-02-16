%% Data capture code.
% Compare floor of pProgess to intervals of 5 to capture at 5% increments to steady state.
% Use a flag to ensure that each percentage increment is only recorded once.

%if flag == 0
%    if floor(pProgress) >= pProgressNext
%        captureData;
%
%        pProgressNext = pProgressNext + 5;
%        flag = 1;
%    end
%else
%    if floor(pProgress) >= pProgressNext - 4
%        flag = 0;
%    end
%end
if floor(pProgress/5) * 5 >= pProgressNext + 5
    pProgressNext = floor(pProgress/5) * 5;
end
    
if floor(pProgress) >= pProgressNext
    captureData;

    pProgressNext = pProgressNext + 5;
end
