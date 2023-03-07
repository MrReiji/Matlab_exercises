function correlation = my_xcorr(signal, prefix)
    len_signal = length(signal);
    len_prefix = length(prefix);
    
    correlation = zeros(1, len_signal+len_prefix-1);
    
    for i=1:len_signal
        for j=1:len_prefix
            correlation(i+j-1) = correlation(i+j-1) + signal(i) * prefix(j);
        end
    end
end