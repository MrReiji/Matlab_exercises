
% Zadanie 1b - radix-2

% Funkcja dit(x) wykonuje tylko pierwszy z p etapów podziału. 
% Każdy następny etap powinien być wykonany na zmiennej X1 i X2. 
% Wykorzystując dit(x) zaimplementuj algorytm radix-2 DIT FFT 
% dla długości N = 2^p. Wykorzystaj rekurencję.

function [X] = radix2(x)
    N = length(x);
    x = x(:);                           % macierz wertykalna

    if(N==1)
        X = x;
    else
        X1 = radix2(x(1:2:end));      % próbki parzyste
        X2 = radix2(x(2:2:end));      % próbki nieparzyste

        X = zeros(size(x)); 
        k = (0:N/2-1)'; 
        X(1:N/2)   = X1 + exp(j*2*pi/N .*-k) .* X2;
        X(N/2+1:N) = X1 + exp(j*2*pi/N .* -(k+N/2)) .* X2;
   end
end
