function y = myConv(x, h)
% Funkcja realizująca splot dwóch sygnałów

% odwróć sygnał filtrujący
h = fliplr(h);

% oblicz długości wektorów
M = length(x);
N = length(h);

% zeruj wektor wynikowy
y = zeros(1, M + N - 1);

% oblicz splot
for n = 1:M+N-1
    kmin = max(1, n-M+1);
    kmax = min(n, N);
    for k = kmin:kmax
        y(n) = y(n) + x(n-k+1) * h(k);
    end
end