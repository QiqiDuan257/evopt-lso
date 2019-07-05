function R = evoGetRotationMatrix(funcDim, seed)
% Get the Rotation Matrix.
R = randn(RandStream('mt19937ar', 'Seed', seed), funcDim, funcDim);
for i = 1 : funcDim
    for j = 1 : (i - 1)
        R(:, i) = R(:, i) - R(:, i)' * R(:, j) * R(:, j);
    end
    R(:, i) = R(:, i) / norm(R(:, i));
end
R = R';
end
