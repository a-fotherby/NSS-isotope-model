function [labels] = labelGen(x, y, z)
    total = x + y + z;
    rms = rmsCalc.calculate(total);
    labels = rmsCalc.normalise(rms);
end
