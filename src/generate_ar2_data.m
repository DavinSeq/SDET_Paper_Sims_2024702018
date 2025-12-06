clc;
clear all;
close all;

rows  = 20000;   % Number of series
cols  = 140;     % Length of each series
phi1  = 1.0;     % AR(2) coefficient for x_{t-1}
phi2  = -0.5;    % AR(2) coefficient for x_{t-2}
sigma = 1;       % Innovation standard deviation
mu    = 0;       % Mean (no change point)

data = zeros(rows, cols);

for r = 1:rows
    eps = sigma * randn(1, cols);
    x   = zeros(1, cols);

    x(1) = mu + eps(1);
    if cols >= 2
        x(2) = mu + phi1*(x(1) - mu) + eps(2);
    end

    for t = 3:cols
        x(t) = mu ...
             + phi1*(x(t-1) - mu) ...
             + phi2*(x(t-2) - mu) ...
             + eps(t);
    end

    data(r, :) = x;
end

outfile = fullfile('../data', 'ar2_data.csv');
writematrix(data, outfile);

fprintf('AR(2) dataset successfully saved to %s\n', outfile);
