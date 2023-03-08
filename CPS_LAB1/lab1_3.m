load('adsl_x.mat'); % wczytaj sygnał
M = 32; % długość prefiksu
N = 512; % długość bloku
K = 4; % liczba bloków
prefix = x(end-M*K+1:end); % sygnał prefiksu
prefix_start = M*N*(0:K-1)+1; % początki prefiksów

corr_coef = zeros(K, 1); % inicjalizacja tablicy wynikowej
for i = 1:K
    block = x(prefix_start(i)+M:prefix_start(i)+M+N-1); % wybierz blok sygnału
    [corr, lags] = xcorr(prefix, block); % oblicz korelację wzajemną
    [~, idx] = max(abs(corr)); % znajdź maksymalną wartość korelacji
    delay = lags(idx); % opóźnienie odpowiadające maksymalnej wartości korelacji
    corr_coef(i) = corr(idx); % zapisz maksymalną wartość korelacji
end

function corr_coef = calculate_correlation(x, M, N, K)
    prefix = x(end-M*K+1:end); % sygnał prefiksu
    prefix_start = M*N*(0:K-1)+1; % początki prefiksów
    corr_coef = zeros(K, 1); % inicjalizacja tablicy wynikowej
    for i = 1:K
        block = x(prefix_start(i)+M:prefix_start(i)+M+N-1); % wybierz blok sygnału
        [corr, lags] = xcorr(prefix, block); % oblicz korelację wzajemną
        [~, idx] = max(abs(corr)); % znajdź maksymalną wartość korelacji
        delay = lags(idx); % opóźnienie odpowiadające maksymalnej wartości korelacji
        corr_coef(i) = corr(idx); % zapisz maksymalną wartość korelacji
    end
end
