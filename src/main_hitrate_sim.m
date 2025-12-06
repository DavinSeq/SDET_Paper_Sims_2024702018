clc;
clear all;
close all;

deltas = [0.5 1.0 1.5 2.0 2.5 3.0];

filename = sprintf('delta_%.1f_data.csv', deltas(1));
data = readmatrix(fullfile('..','data',filename));
Nmax = length(data(1,:));

alpha = 0.05;
cvals_05 = generate_lookup_table(alpha, Nmax);

figure;
hold on;

colors = lines(numel(deltas));

for idx = 1:numel(deltas)
    d = deltas(idx);
    
    filename = sprintf('delta_%.1f_data.csv', d);
    
    data = readmatrix(filename);
    
    [h_orig, h_crit, ~, ~] = compute_hitrate_sim(data, cvals_05);
    x = 1:length(h_orig);
    
    plot(x, h_orig, '-', 'LineWidth', 2, ...
         'Color', colors(idx,:), ...
         'DisplayName', sprintf('\\delta = %.1f (orig)', d));
    
    plot(x, h_crit, ':', 'LineWidth', 2, ...
         'Color', colors(idx,:), ...
         'DisplayName', sprintf('\\delta = %.1f (crit)', d));
end

xline(30, '--k', 'LineWidth', 1.5, 'DisplayName', 'Index = 30');

xlabel('Index');
ylabel('Hitrate');
title('Original vs Critical Hitrate for Different \delta');
grid on;
legend('show', 'Location', 'bestoutside');

figname = sprintf('hitrate_sim_%.1f.png', alpha);
saveas(gcf, fullfile('..','figs',figname));

hold off;
