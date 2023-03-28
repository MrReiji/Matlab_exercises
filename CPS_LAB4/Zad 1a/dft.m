
% Zadanie 1a - DFT

function [X] = dft(x)
    
    N = length(x);
    k = 0:N-1;
    X(k+1) = 0;

    for n=0:N-1
        X = X + x(n+1)*exp(1i*2*pi/N).^(-k*n);
    end
end