clc; clear; close all;

data = readmatrix(fullfile('..','data','ar2_data.csv'));
[n_samples, Nmax] = size(data);

alpha = 0.05;
cvals_05 = generate_lookup_table(alpha, Nmax);

window_lengths = [32, 40, 50, 80, 140];

colors = {'b','r','g','y','m'};     % One per Window Plot
styles = {'-', ':'};                % For Legend (solid for Naive, Dotted for Crit Rule)

fp_orig   = cell(1, numel(window_lengths));
fp_crit   = cell(1, numel(window_lengths));

for k = 1:numel(window_lengths)
    W = window_lengths(k);

    [h1, h2] = histogram_gen(data, cvals_05, W);

    fp_orig{k} = 100 * h1;
    fp_crit{k} = 100 * h2;
end

figure; hold on; grid on;

legend_entries = {};

for k = 1:numel(window_lengths)
    W = window_lengths(k);

    plot(fp_crit{k}, styles{2}, color=colors{k});
    legend_entries{end+1} = sprintf('1961–%d Crit', 1960+W);

    plot(fp_orig{k}, styles{1}, color=colors{k});
    legend_entries{end+1} = sprintf('1961–%d Orig', 1960+W);
end

xlabel('Year');
ylabel('False Det (%)');
title('False Detection Percentage vs Year');
legend(legend_entries);

saveas(gcf, fullfile('..','figs','false_detection_windows.png'));

hold off;
