%% Have a fucntion which writes the record matricies out to a file. 
classdef writeData
  methods(Static)
    function [] = output(trial, typeSTR, record, steadyStateSwitch, recycling, dif)
      name = sprintf('Case%d_%s_ssw_%d_rec_%d_diff_%.1f.dat', trial, typeSTR, steadyStateSwitch, recycling, dif);
      dlmwrite(name, record, 'delimiter', '\t');
    end
  end
end
