function [fp_histogram, fp_histogram_crit] = histogram_gen(data, c, year_range)

    columns = length(data(1,:));
    rows    = length(data(:,1));
    fp_histogram = zeros(1,140);
    fp_histogram_crit = zeros(1,140);

    for index = 1:rows
            year = year_range;

            mean0 = mean(data(index,1:year));
            RSS1  = 0;
            for k = 1:year
                RSS1 = RSS1 + ((data(index,k) - mean0)^2);
            end
            SIC0 = year*(log(RSS1) + 1 + log(2*pi) - log(year)) + 4*log(year);

            SIC = ones(1,columns);
            for i = 2:(year-2)
                mean1 = mean(data(index,1:i));
                mean2 = mean(data(index,i+1:year));

                RSS2 = 0;
                for j = 1:i
                    RSS2 = RSS2 + ((data(index,j) - mean1)^2);
                end
                for j = i:year
                    RSS2 = RSS2 + ((data(index,j) - mean2)^2);
                end

                SIC(i) = year * (log(RSS2) + 1 + log(2*pi) - log(year)) + 8*log(year);
            end

            [min_value, min_index] = min(SIC(2:(year-2)));

            if (min_value <= SIC0)
                fp_histogram(min_index) = fp_histogram(min_index) + 1;
            end

            crit = c(year);

            if (min_value + crit <= SIC0)
                fp_histogram_crit(min_index) = fp_histogram_crit(min_index) + 1;
            end
            
    end
    fp_histogram = fp_histogram./(rows);
    fp_histogram_crit = fp_histogram_crit./(rows);
end
