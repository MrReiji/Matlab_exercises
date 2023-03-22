N = 100;     % liczba próbek
fs = 1000;   % częstotliwość próbkowania
f1 = 100;    % częstotliwość pierwszej składowej sygnału
f2 = 200;    % częstotliwość drugiej składowej sygnału
A1 = 100;    % amplituda pierwszej składowej sygnału
A2 = 200;    % amplituda drugiej składowej sygnału
phi1 = pi/7; % kąt fazowy pierwszej składowej sygnału
phi2 = pi/11;% kąt fazowy drugiej składowej sygnału

t = (0:N-1)/fs;   % czas próbkowania
x = A1*cos(2*pi*f1*t+phi1) + A2*cos(2*pi*f2*t+phi2); % sygnał x

W_N = exp(-1i*2*pi/N);    % wyznaczamy W_N
A = zeros(N,N);          % tworzymy pustą macierz A
for k = 0:N-1
    for n = 0:N-1
        A(k+1,n+1) = (1/sqrt(N))*W_N^(-k*n); % wypełniamy macierz A transformacji DFT
    end
end


X = A*x'; % DFT sygnału x
% WYKRES WIDMA
f = (0:N-1)*fs/N; % osie częstotliwości
figure
subplot(2,2,1)
plot(f,real(X),'b-',f,imag(X),'r-')
xlabel('Częstotliwość [Hz]')
ylabel('Amplituda')
legend('Część rzeczywista','Część urojona')
title('Widmo sygnału x')
subplot(2,2,2)
plot(f,abs(X),'b-')
xlabel('Częstotliwość [Hz]')
ylabel('Amplituda')
title('Moduł widma sygnału x')
subplot(2,2,3)
plot(f,angle(X),'b-')
xlabel('Częstotliwość [Hz]')
ylabel('Faza')
title('Faza widma sygnału x')
subplot(2,2,4)
plot(t,x,'b-')
xlabel('Czas [s]')
ylabel('Amplituda')
title('Sygnał x')