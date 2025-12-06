function [hitrate_original, hitrate_crit, hit_original, hit_crit] = compute_hitrate_sim(data, c)

    columns = length(data(1,:));
    rows    = length(data(:,1));

    hit_original = zeros(rows,columns);
    hit_crit     = zeros(rows,columns);

    for index = 1:rows
        for year = 1:columns

            if year < 30
                hit_original(index,year) = 0;
                hit_crit(index,year)     = 0;
                continue;
            end

            mean0 = mean(data(index,1:year));
            RSS1  = 0;
            for k = 1:year
                RSS1 = RSS1 + ((data(index,k) - mean0)^2);
            end
            SIC0 = year * (log(RSS1) + 1 + log(2*pi) - log(year)) + 2 * log(year);

            SIC = ones(1,columns);
            for i = 1:year
                mean1 = mean(data(index,1:i));
                mean2 = mean(data(index,i+1:year));

                RSS2 = 0;
                for j = 1:i
                    RSS2 = RSS2 + ((data(index,j) - mean1)^2);
                end
                for j = i:year
                    RSS2 = RSS2 + ((data(index,j) - mean2)^2);
                end

                SIC(i) = year * (log(RSS2) + 1 + log(2*pi) - log(year)) + 3 * log(year);
            end

            [min_value, min_index] = min(SIC(1:year));


            if (min_index >= 28 && min_index <= 32 && min_value <= SIC0)
                hit_original(index,year) = 1;
            else
                hit_original(index,year) = 0;
            end

            crit = c(year);

            if (min_index >= 28 && min_index <= 32 && min_value + crit <= SIC0)
                hit_crit(index,year) = 1;
            else
                hit_crit(index,year) = 0;
            end

        end
    end

    hitrate_original = mean(hit_original, 1);
    hitrate_crit     = mean(hit_crit, 1);
end


