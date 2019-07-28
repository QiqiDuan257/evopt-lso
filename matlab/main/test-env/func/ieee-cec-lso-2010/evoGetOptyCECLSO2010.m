function statOptys = evoGetOptyCECLSO2010(statOptRes)
% Get `opty` for IEEE-CEC-LSO-2010.
if numel(statOptRes) ~= 20
    error('`numel(statOptRes)` should equal 20.');
end
statOptys = Inf * ones(length(statOptRes), 4); % mean + std + median + best
for f = 1 : length(statOptRes)
    statOpty = Inf * ones(length(statOptRes{f}), 1);
    for e = 1 : length(statOptRes{f})
        statOpty(e) = statOptRes{f}{e}.opty;
    end
    statOptys(f, :) = [mean(statOpty) std(statOpty) ...
        median(statOpty) min(statOpty)];
end
end
