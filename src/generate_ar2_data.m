function generate_ar2_data(n_samples, Nmax, phi1, phi2, sigma, mu)

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
                 + phi1*(x(t-1)-mu) ...
                 + phi2*(x(t-2)-mu) ...
                 + eps(t);
        end

        data_array(:, col) = x;
    end

    filename = fullfile('../data', outname);
    writematrix(data_array, filename);

    fprintf('Saved AR(2) data to %s\n', filename);
end
