
% Zadanie 1b - Decimation i Time

function [X] = dit(x)
    N = length(x);
    x = x(:);             % macierz wertykalna
    X1 = fft(x(1:2:N));   % próbki parzyste
    X2 = fft(x(2:2:N));   % próbki nieparzyste

    X = zeros(size(x));
    k = (0:N/2-1)';
    X(1:N/2)   = X1 + exp(j*2*pi/N .*-k) .* X2;
    X(N/2+1:N) = X1 + exp(j*2*pi/N .* -(k+N/2)) .* X2;
end