function c = generate_lookup_table(alpha, Nmax)

    c = zeros(1, Nmax);

    for n = 2:Nmax
        L1 = log(n);
        L2 = log(L1);
        L3 = log(L2);

        inner = 1 - alpha + exp(-2 * exp(2 * L2 + L3));
        term1 = -log( log( inner.^(-1/2) ) ) ./ sqrt(2 * L2);
        term2 = (2 * L2 + L3) ./ sqrt(2 * L2);

        c(n) = -2 * L1 + (term1 + term2).^2;
    end
end
