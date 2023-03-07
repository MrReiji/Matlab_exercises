load('adsl_x.mat');
signal = x';
K = 4;
M = 32;
N = 512;
prefix_length = M;
prefixes_start = [];

% znajdowanie początku każdego prefiksu
for i=1:K
    % dla każdego bloku, znajdź początek prefiksu
    start = (i-1)*(M+N)+1;
    prefix = signal(start:start+prefix_length-1);
    
    % oblicz korelację między sygnałem a prefiksem
    correlation = xcorr(signal, prefix);
    [~, index] = max(correlation);
    
    % zapisz początek prefiksu
    prefixes_start(i) = index - length(signal);
end

prefixes_start,

