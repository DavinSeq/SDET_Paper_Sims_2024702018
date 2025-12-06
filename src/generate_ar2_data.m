clc;
clear;
close all;

n_samples = 20000;     % Number of simulated time series
Nmax      = 140;       % Maximum time length
sigma     = 1;         % Standard Deviation
mu        = 0;         % Mean of AR(2) data
phi1      = 1.6;       % AR(2) Coefficient for i-1th data
phi2      = -0.65;     % AR(2) Coefficient for i-2th data

data_array = zeros(n_samples, Nmax);

for col = 1:Nmax

    eps = sigma * randn(n_samples, 1);
    x   = zeros(n_samples, 1);

    x(1) = mu + eps(1);
    if n_samples >= 2
        x(2) = mu + phi1*(x(1)-mu) + eps(2);
    end

    for t = 3:n_samples
        x(t) = mu ...
             + phi1*(x(t-1) - mu) ...
             + phi2*(x(t-2) - mu) ...
             + eps(t);
    end

    data_array(:, col) = x;
end

outfile = fullfile('../data', 'ar2_data.csv');    % Filename for data storage as .csv
writematrix(data_array, outfile);

fprintf('AR(2) dataset successfully saved to %s\n', outfile);
