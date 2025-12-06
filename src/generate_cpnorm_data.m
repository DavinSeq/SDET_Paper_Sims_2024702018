clc;
clear all;
close all;

n_samples = 2000;
sigma = 1;
deltas = 0:0.5:3;
years = 1961:2100;

for delta_idx = 1:length(deltas)
    delta = deltas(delta_idx);
    mean1 = -delta/2; 
    mean2 = delta/2; 
    
    data_array = zeros(n_samples, 140);
    
    year_idx = 1;
    for year = 1961:2100
        if year <= 1990
            current_mean = mean1;
        else
            current_mean = mean2;
        end
        
        data_array(:, year_idx) = current_mean + sigma * randn(n_samples, 1);
        year_idx = year_idx + 1;
    end

    csv_filename = fullfile('..','data', sprintf('delta_%.1f_data.csv', delta));
    
    writematrix(data_array, csv_filename);
    
    fprintf('Saved %d x %d data for delta = %.1f to %s\n', ...
            n_samples, 140, delta, csv_filename);
end
